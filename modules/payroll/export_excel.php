<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/erp/config/database.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/erp/config/auth.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/erp/config/functions.php';
requireRole('director', 'accountant');

$pdo      = getDBConnection();
$periodId = (int)($_GET['period_id'] ?? 0);
if (!$periodId) { header('Location: /erp/modules/payroll/index.php'); exit; }

$stmt = $pdo->prepare("SELECT * FROM payroll_periods WHERE id = ?");
$stmt->execute([$periodId]);
$period = $stmt->fetch(PDO::FETCH_ASSOC);
if (!$period) die('Kỳ lương không tồn tại.');

$stmt = $pdo->prepare("
    SELECT ps.*, u.full_name, u.employee_code, d.name AS department_name,
           ep.identity_no, ep.personal_tax_code, ep.social_book_no, ep.bank_account, ep.bank_name, ep.date_joined
    FROM payroll_slips ps
    JOIN users u ON ps.user_id = u.id
    LEFT JOIN employee_profiles ep ON ep.user_id = u.id
    LEFT JOIN departments d ON u.department_id = d.id
    WHERE ps.period_id = ?
    ORDER BY d.name, u.full_name
");
$stmt->execute([$periodId]);
$slips = $stmt->fetchAll(PDO::FETCH_ASSOC);

$fileName = 'BangLuong_T' . $period['period_month'] . '_' . $period['period_year'] . '.xls';
header('Content-Type: application/vnd.ms-excel; charset=utf-8');
header('Content-Disposition: attachment; filename="' . $fileName . '"');

function n(float $val, int $dec = 0): string { return number_format($val, $dec, '.', ','); }
function e(string $str): string { return htmlspecialchars($str, ENT_QUOTES, 'UTF-8'); }
?>
<html><head><meta charset="UTF-8"></head><body>
<table border="1" cellspacing="0" cellpadding="3">
<tr><th>#</th><th>Mã NV</th><th>Họ tên</th><th>Phòng ban</th>
<th>Ăn ca</th><th>Trang phục</th><th>Điện thoại</th><th>Đi lại</th><th>Nhà ở</th><th>PC Trách nhiệm</th><th>PC Thâm niên</th><th>Tổng trợ cấp</th>
<th>Gross</th><th>Net</th></tr>
<?php foreach ($slips as $i => $s):
    $housing = (float)($s['housing_received'] ?? 0);
    $resp    = (float)($s['responsibility_allowance_received'] ?? 0);
    $sen     = (float)($s['seniority_allowance_received'] ?? 0);
    $totalAllow = (float)$s['meal_received'] + (float)$s['clothes_received'] + (float)$s['phone_received'] + (float)$s['transport_received'] + $housing + $resp + $sen;
?>
<tr>
<td><?= $i+1 ?></td>
<td><?= e($s['employee_code'] ?? '') ?></td>
<td><?= e($s['full_name']) ?></td>
<td><?= e($s['department_name'] ?? '') ?></td>
<td align="right"><?= n((float)$s['meal_received']) ?></td>
<td align="right"><?= n((float)$s['clothes_received']) ?></td>
<td align="right"><?= n((float)$s['phone_received']) ?></td>
<td align="right"><?= n((float)$s['transport_received']) ?></td>
<td align="right"><?= n($housing) ?></td>
<td align="right"><?= n($resp) ?></td>
<td align="right"><?= n($sen) ?></td>
<td align="right"><?= n($totalAllow) ?></td>
<td align="right"><?= n((float)$s['gross_salary']) ?></td>
<td align="right"><?= n((float)$s['net_salary']) ?></td>
</tr>
<?php endforeach; ?>
</table>
</body></html>