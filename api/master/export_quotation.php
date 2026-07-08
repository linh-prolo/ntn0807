<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/erp/config/database.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/erp/config/auth.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/erp/config/functions.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/erp/vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Worksheet\PageSetup;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;

requireLogin();
requireRole('director', 'accountant', 'manager');

$pdo        = getDBConnection();
$customerId = (int)($_GET['customer_id'] ?? 0);

if ($customerId <= 0) {
    http_response_code(400);
    echo 'Tham số không hợp lệ';
    exit;
}

// ── Lấy thông tin khách hàng (đầy đủ) ──────────────────────────────────────
$customerStmt = $pdo->prepare("
    SELECT id, customer_code, customer_name, address, tax_code, phone, email
    FROM customers
    WHERE id = ?
    LIMIT 1
");
$customerStmt->execute([$customerId]);
$customer = $customerStmt->fetch(PDO::FETCH_ASSOC);

if (!$customer) {
    http_response_code(404);
    echo 'Không tìm thấy khách hàng';
    exit;
}

// ── Lấy bảng giá hiện tại ──────────────────────────────────────────────────
$priceStmt = $pdo->prepare("
    SELECT cp.*, pc.product_code, pc.description, pc.unit
    FROM customer_prices cp
    JOIN product_codes pc ON cp.product_code_id = pc.id
    LEFT JOIN customer_prices cp_newer
           ON cp_newer.customer_id = cp.customer_id
          AND cp_newer.product_code_id = cp.product_code_id
          AND cp_newer.effective_date <= CURDATE()
          AND (cp_newer.expired_date IS NULL OR cp_newer.expired_date >= CURDATE())
          AND (
               cp_newer.effective_date > cp.effective_date
               OR (cp_newer.effective_date = cp.effective_date AND cp_newer.id > cp.id)
          )
    WHERE cp.customer_id = ?
      AND cp.effective_date <= CURDATE()
      AND (cp.expired_date IS NULL OR cp.expired_date >= CURDATE())
      AND cp_newer.id IS NULL
    ORDER BY pc.product_code
");
$priceStmt->execute([$customerId]);
$currentPrices = $priceStmt->fetchAll(PDO::FETCH_ASSOC);

if (empty($currentPrices)) {
    http_response_code(404);
    echo 'Không có bảng giá hiện tại để xuất';
    exit;
}

// ── Thông tin công ty NTN (có thể override từ system_settings) ─────────────
$companyName    = 'CÔNG TY CỔ PHẦN SẢN XUẤT VÀ CUNG ỨNG NTN VIỆT NAM';
$companyAddress = 'Số 36, Xóm Trại, Quan Âm, Xã Phúc Thịnh, TP. Hà Nội';
$companyTax     = '0111343796';
$companyPhone   = '';
$companyEmail   = '';
$companyWebsite = '';

try {
    $cfg = $pdo->query(
        "SELECT setting_key, setting_value FROM system_settings
         WHERE setting_key IN ('company_name','company_address','company_tax','company_phone','company_email','company_website')"
    )->fetchAll(PDO::FETCH_KEY_PAIR);
    if (!empty($cfg['company_name']))    $companyName    = $cfg['company_name'];
    if (!empty($cfg['company_address'])) $companyAddress = $cfg['company_address'];
    if (!empty($cfg['company_tax']))     $companyTax     = $cfg['company_tax'];
    if (!empty($cfg['company_phone']))   $companyPhone   = $cfg['company_phone'];
    if (!empty($cfg['company_email']))   $companyEmail   = $cfg['company_email'];
    if (!empty($cfg['company_website'])) $companyWebsite = $cfg['company_website'];
} catch (Throwable $e) { /* bỏ qua */ }

// ── Ngày tháng ────────────────────────────────────────────────────────────
$now              = new DateTimeImmutable('now', new DateTimeZone('Asia/Ho_Chi_Minh'));
$documentDate     = $now->format('Ymd');
$displayDate      = $now->format('d/m/Y');
$customerCode     = trim((string)($customer['customer_code'] ?? '')) ?: (string)$customer['id'];
$safeCustomerCode = preg_replace('/[^A-Za-z0-9_-]+/', '_', $customerCode) ?: (string)$customer['id'];
$quotationNo      = 'NTN-QT-' . $customerCode . '-' . $documentDate;

// ══════════════════════════════════════════════════════════════════════════════
// BUILD SPREADSHEET
// ══════════════════════════════════════════════════════════════════════════════
$spreadsheet = new Spreadsheet();
$sheet       = $spreadsheet->getActiveSheet();
$sheet->setTitle('Quotation');
$sheet->setShowGridlines(false);
$spreadsheet->getDefaultStyle()->getFont()->setName('Times New Roman')->setSize(10);
$spreadsheet->getDefaultStyle()->getAlignment()->setVertical(Alignment::VERTICAL_CENTER);

// ── Page setup ───────────────────────────────────────────────────────────────
$ps = $sheet->getPageSetup();
$ps->setOrientation(PageSetup::ORIENTATION_PORTRAIT);
$ps->setPaperSize(PageSetup::PAPERSIZE_A4);
$ps->setFitToPage(true)->setFitToWidth(1)->setFitToHeight(0);
$sheet->getPageMargins()->setTop(0.6)->setBottom(0.6)->setLeft(0.55)->setRight(0.55);

// ── Column widths (A..J) ─────────────────────────────────────────────────────
// A=No, B=Code, C=Description, D=Unit, E=Qty, F=Maker, G=Price(VND), H=Amount(VND), I=Re-mark, J=spacer
$colW = ['A'=>5,'B'=>18,'C'=>36,'D'=>10,'E'=>8,'F'=>14,'G'=>16,'H'=>16,'I'=>14];
foreach ($colW as $col => $w) {
    $sheet->getColumnDimension($col)->setWidth($w);
}

// ── Màu sắc ──────────────────────────────────────────────────────────────────
$C_NAVY  = '17375E';
$C_RED   = 'C00000';
$C_GOLD  = 'F4B942';
$C_WHITE = 'FFFFFF';
$C_LGRAY = 'F2F2F2';
$C_DARK  = '262626';
$C_LBLUE = 'EBF3FB';

// Helper: áp style nhanh
$S = function (string $range, array $style) use ($sheet): void {
    $sheet->getStyle($range)->applyFromArray($style);
};

// ══════════════════════════════════════════════════════════════════════════════
// SECTION 1 — HEADER CÔNG TY
// ══════════════════════════════════════════════════════════════════════════════
$r = 1;
$sheet->getRowDimension($r)->setRowHeight(4); $r++; // dòng trắng trên

// Tên công ty (dòng 2-3, merge)
$sheet->getRowDimension($r)->setRowHeight(22);
$sheet->mergeCells("A{$r}:I{$r}");
$sheet->setCellValue("A{$r}", $companyName);
$S("A{$r}", [
    'font'      => ['bold' => true, 'size' => 14, 'color' => ['rgb' => $C_RED]],
    'alignment' => ['horizontal' => Alignment::HORIZONTAL_CENTER],
]);
$r++;

// Địa chỉ
$sheet->getRowDimension($r)->setRowHeight(13);
$sheet->mergeCells("A{$r}:I{$r}");
$sheet->setCellValue("A{$r}", 'Địa chỉ / Add: ' . $companyAddress);
$S("A{$r}", [
    'font'      => ['size' => 9, 'color' => ['rgb' => '444444']],
    'alignment' => ['horizontal' => Alignment::HORIZONTAL_CENTER],
]);
$r++;

// MST + Phone + Email
$contactParts = [];
if ($companyTax     !== '') $contactParts[] = 'MST / Tax Code: ' . $companyTax;
if ($companyPhone   !== '') $contactParts[] = 'Phone: ' . $companyPhone;
if ($companyEmail   !== '') $contactParts[] = 'Email: ' . $companyEmail;
if ($companyWebsite !== '') $contactParts[] = 'Website: ' . $companyWebsite;

$sheet->getRowDimension($r)->setRowHeight(13);
$sheet->mergeCells("A{$r}:I{$r}");
$sheet->setCellValue("A{$r}", implode('     ', $contactParts));
$S("A{$r}", [
    'font'      => ['size' => 9, 'color' => ['rgb' => '444444']],
    'alignment' => ['horizontal' => Alignment::HORIZONTAL_CENTER],
]);
$r++;

// Đường kẻ đỏ + vàng
$sheet->getRowDimension($r)->setRowHeight(3);
$sheet->mergeCells("A{$r}:I{$r}");
$S("A{$r}", ['fill' => ['fillType' => Fill::FILL_SOLID, 'startColor' => ['rgb' => $C_RED]]]);
$r++;
$sheet->getRowDimension($r)->setRowHeight(2);
$sheet->mergeCells("A{$r}:I{$r}");
$S("A{$r}", ['fill' => ['fillType' => Fill::FILL_SOLID, 'startColor' => ['rgb' => $C_GOLD]]]);
$r++;

$sheet->getRowDimension($r)->setRowHeight(4); $r++; // khoảng cách

// ══════════════════════════════════════════════════════════════════════════════
// SECTION 2 — TIÊU ĐỀ
// ══════════════════════════════════════════════════════════════════════════════
// No + Date
$sheet->getRowDimension($r)->setRowHeight(14);
$sheet->mergeCells("A{$r}:D{$r}");
$sheet->setCellValue("A{$r}", 'No: ' . $quotationNo);
$S("A{$r}", ['font' => ['bold' => true, 'size' => 9]]);
$sheet->mergeCells("E{$r}:F{$r}");
$sheet->setCellValue("E{$r}", 'Date:');
$S("E{$r}", ['font' => ['bold' => true, 'size' => 9], 'alignment' => ['horizontal' => Alignment::HORIZONTAL_RIGHT]]);
$sheet->mergeCells("G{$r}:I{$r}");
$sheet->setCellValue("G{$r}", $displayDate);
$S("G{$r}", ['font' => ['bold' => true, 'size' => 9, 'color' => ['rgb' => $C_RED]]]);
$r++;

$sheet->getRowDimension($r)->setRowHeight(4); $r++;

// QUOTATION (tiêu đề chính)
$sheet->getRowDimension($r)->setRowHeight(28);
$sheet->mergeCells("A{$r}:I{$r}");
$sheet->setCellValue("A{$r}", 'QUOTATION');
$S("A{$r}", [
    'font'      => ['bold' => true, 'size' => 18, 'name' => 'Times New Roman'],
    'alignment' => ['horizontal' => Alignment::HORIZONTAL_CENTER, 'vertical' => Alignment::VERTICAL_CENTER],
]);
$r++;

$sheet->getRowDimension($r)->setRowHeight(4); $r++;

// ══════════════════════════════════════════════════════════════════════════════
// SECTION 3 — THÔNG TIN KHÁCH HÀNG
// ══════════════════════════════════════════════════════════════════════════════
// "To:"
$sheet->getRowDimension($r)->setRowHeight(13);
$sheet->mergeCells("A{$r}:I{$r}");
$sheet->setCellValue("A{$r}", 'Kính gửi / To:');
$S("A{$r}", ['font' => ['italic' => true, 'size' => 9]]);
$r++;

// Tên công ty KH
$sheet->getRowDimension($r)->setRowHeight(18);
$sheet->mergeCells("A{$r}:I{$r}");
$sheet->setCellValue("A{$r}", strtoupper($customer['customer_name'] ?? ''));
$S("A{$r}", ['font' => ['bold' => true, 'size' => 12]]);
$r++;

// Địa chỉ KH
if (!empty($customer['address'])) {
    $sheet->getRowDimension($r)->setRowHeight(13);
    $sheet->mergeCells("A{$r}:I{$r}");
    $sheet->setCellValue("A{$r}", 'Địa chỉ / Add: ' . $customer['address']);
    $S("A{$r}", ['font' => ['size' => 9]]);
    $r++;
}

// MST KH
if (!empty($customer['tax_code'])) {
    $sheet->getRowDimension($r)->setRowHeight(13);
    $sheet->mergeCells("A{$r}:I{$r}");
    $sheet->setCellValue("A{$r}", 'MST / Tax Code: ' . $customer['tax_code']);
    $S("A{$r}", ['font' => ['size' => 9]]);
    $r++;
}

$sheet->getRowDimension($r)->setRowHeight(5); $r++;

// ── Lời mở đầu ───────────────────────────────────────────────────────────────
$introLines = [
    'First of all, we would like to express our sincere thank for your interest in our products,',
    'and believe these products will fully meet your expectations.',
    'We are pleased to quote the under-mentioned goods as per conditions and details described as follows:',
];
foreach ($introLines as $line) {
    $sheet->getRowDimension($r)->setRowHeight(13);
    $sheet->mergeCells("A{$r}:I{$r}");
    $sheet->setCellValue("A{$r}", $line);
    $S("A{$r}", ['font' => ['size' => 9], 'alignment' => ['wrapText' => true]]);
    $r++;
}

$sheet->getRowDimension($r)->setRowHeight(5); $r++;

// ══════════════════════════════════════════════════════════════════════════════
// SECTION 4 — BẢNG HÀNG
// ══════════════════════════════════════════════════════════════════════════════
$headers    = ['No', 'Code', 'Description of goods', 'Unit', 'Qty', 'Maker', 'Price (VND)', 'Amount (VND)', 'Re-mark'];
$headerCols = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I'];
$headerAligns = [
    Alignment::HORIZONTAL_CENTER,
    Alignment::HORIZONTAL_CENTER,
    Alignment::HORIZONTAL_CENTER,
    Alignment::HORIZONTAL_CENTER,
    Alignment::HORIZONTAL_CENTER,
    Alignment::HORIZONTAL_CENTER,
    Alignment::HORIZONTAL_CENTER,
    Alignment::HORIZONTAL_CENTER,
    Alignment::HORIZONTAL_CENTER,
];

$sheet->getRowDimension($r)->setRowHeight(22);
foreach ($headers as $ci => $hdr) {
    $col = $headerCols[$ci];
    $sheet->setCellValue("{$col}{$r}", $hdr);
    $S("{$col}{$r}", [
        'font'      => ['bold' => true, 'size' => 9, 'color' => ['rgb' => $C_WHITE], 'name' => 'Arial'],
        'fill'      => ['fillType' => Fill::FILL_SOLID, 'startColor' => ['rgb' => $C_NAVY]],
        'alignment' => [
            'horizontal' => $headerAligns[$ci],
            'vertical'   => Alignment::VERTICAL_CENTER,
            'wrapText'   => true,
        ],
        'borders'   => ['allBorders' => ['borderStyle' => Border::BORDER_THIN, 'color' => ['rgb' => 'A0A0A0']]],
    ]);
}
$tblHeaderRow = $r;
$r++;

// ── Dữ liệu hàng ─────────────────────────────────────────────────────────────
foreach ($currentPrices as $idx => $priceRow) {
    $sheet->getRowDimension($r)->setRowHeight(15);
    $bg          = ($idx % 2 === 0) ? $C_WHITE : $C_LGRAY;
    $amountFml   = sprintf('=IF(OR(E%d="",G%d=""),"",E%d*G%d)', $r, $r, $r, $r);

    $rowData = [
        'A' => $idx + 1,
        'B' => $priceRow['product_code'] ?? '',
        'C' => $priceRow['description']  ?? '',
        'D' => $priceRow['unit']         ?? '',
        'E' => '',                            // Qty — để trống cho KH điền
        'F' => '',                            // Maker
        'G' => (float)($priceRow['unit_price'] ?? 0),
        'H' => $amountFml,
        'I' => '',
    ];

    foreach ($rowData as $col => $val) {
        $sheet->setCellValue("{$col}{$r}", $val);
        $S("{$col}{$r}", [
            'font'  => ['size' => 9, 'name' => 'Arial'],
            'fill'  => ['fillType' => Fill::FILL_SOLID, 'startColor' => ['rgb' => $bg]],
            'borders' => ['allBorders' => ['borderStyle' => Border::BORDER_THIN, 'color' => ['rgb' => 'CCCCCC']]],
        ]);
    }

    // Canh lề
    $sheet->getStyle("A{$r}")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
    $sheet->getStyle("D{$r}:F{$r}")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
    $sheet->getStyle("G{$r}:H{$r}")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_RIGHT);
    $sheet->getStyle("G{$r}:H{$r}")->getNumberFormat()->setFormatCode('#,##0');
    $sheet->getStyle("C{$r}")->getAlignment()->setWrapText(true);

    $r++;
}

// Viền ngoài bảng
$S("A{$tblHeaderRow}:I" . ($r - 1), [
    'borders' => ['outline' => ['borderStyle' => Border::BORDER_MEDIUM, 'color' => ['rgb' => $C_NAVY]]],
]);

$sheet->getRowDimension($r)->setRowHeight(5); $r++;

// ══════════════════════════════════════════════════════════════════════════════
// SECTION 5 — FOOTER: ĐIỀU KHOẢN + LIÊN HỆ
// ══════════════════════════════════════════════════════════════════════════════
$footerLines = [
    '▲ Payment term: T/T in advance',
    '▲ Delivery time: refer remark',
    '▲ Shipping terms: EXW',
    '▲ Validity: This quotation is valid 3 months from the date of submission.',
];
foreach ($footerLines as $fl) {
    $sheet->getRowDimension($r)->setRowHeight(13);
    $sheet->mergeCells("A{$r}:I{$r}");
    $sheet->setCellValue("A{$r}", $fl);
    $S("A{$r}", [
        'font'      => ['size' => 9, 'color' => ['rgb' => $C_RED]],
        'alignment' => ['horizontal' => Alignment::HORIZONTAL_LEFT],
    ]);
    $r++;
}

$sheet->getRowDimension($r)->setRowHeight(10); $r++;

// "We look forward..."
$closingLines = [
    'We look forward to your soon confirmation!',
];
foreach ($closingLines as $cl) {
    $sheet->getRowDimension($r)->setRowHeight(13);
    $sheet->mergeCells("A{$r}:I{$r}");
    $sheet->setCellValue("A{$r}", $cl);
    $S("A{$r}", ['font' => ['size' => 9, 'italic' => true]]);
    $r++;
}

// "For more information..."
$sheet->getRowDimension($r)->setRowHeight(13);
$sheet->mergeCells("A{$r}:I{$r}");
$sheet->setCellValue("A{$r}", 'For more information, please contact:');
$S("A{$r}", ['font' => ['size' => 9]]);
$r++;

// Người liên hệ — lấy từ user đang đăng nhập
$currentUser = currentUser();
$contactName  = strtoupper($currentUser['full_name'] ?? '');
$contactPhone = $currentUser['phone'] ?? $companyPhone;

$sheet->getRowDimension($r)->setRowHeight(15);
$sheet->mergeCells("A{$r}:I{$r}");
$sheet->setCellValue("A{$r}", 'Mr./Ms. ' . $contactName);
$S("A{$r}", ['font' => ['bold' => true, 'size' => 10]]);
$r++;

if (!empty($contactPhone)) {
    $sheet->getRowDimension($r)->setRowHeight(13);
    $sheet->mergeCells("A{$r}:I{$r}");
    $sheet->setCellValue("A{$r}", 'M: ' . $contactPhone);
    $S("A{$r}", ['font' => ['size' => 9]]);
    $r++;
}
if (!empty($companyEmail)) {
    $sheet->getRowDimension($r)->setRowHeight(13);
    $sheet->mergeCells("A{$r}:I{$r}");
    $sheet->setCellValue("A{$r}", 'E: ' . $companyEmail);
    $S("A{$r}", ['font' => ['size' => 9]]);
    $r++;
}

$sheet->getRowDimension($r)->setRowHeight(5); $r++;

// ── Footer đỏ ─────────────────────────────────────────────────────────────────
$sheet->getRowDimension($r)->setRowHeight(3);
$sheet->mergeCells("A{$r}:I{$r}");
$S("A{$r}", ['fill' => ['fillType' => Fill::FILL_SOLID, 'startColor' => ['rgb' => $C_GOLD]]]);
$r++;
$sheet->getRowDimension($r)->setRowHeight(3);
$sheet->mergeCells("A{$r}:I{$r}");
$S("A{$r}", ['fill' => ['fillType' => Fill::FILL_SOLID, 'startColor' => ['rgb' => $C_RED]]]);
$r++;

// ══════════════════════════════════════════════════════════════════════════════
// OUTPUT
// ══════════════════════════════════════════════════════════════════════════════
$sheet->getPageSetup()->setPrintArea("A1:I{$r}");

$filename = 'Quotation_' . $safeCustomerCode . '_' . $documentDate . '.xlsx';

header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
header('Content-Disposition: attachment; filename="' . $filename . '"');
header('Cache-Control: max-age=0');

(new Xlsx($spreadsheet))->save('php://output');
exit;
