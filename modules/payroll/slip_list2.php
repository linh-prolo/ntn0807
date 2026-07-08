<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/erp/config/database.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/erp/config/auth.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/erp/config/functions.php';
requireRole('director', 'accountant');

$pdo  = getDBConnection();
$user = currentUser();

$periodId = (int)($_GET['period_id'] ?? 0);
if (!$periodId) {
    setFlash('danger', 'Không tìm thấy kỳ lương.');
    header('Location: /erp/modules/payroll/index.php'); exit;
}

$stmt = $pdo->prepare("
    SELECT pp.*,
           u1.full_name AS created_name,
           u2.full_name AS submitted_name,
           u3.full_name AS approved_name,
           u4.full_name AS locked_name
    FROM payroll_periods pp
    LEFT JOIN users u1 ON pp.created_by   = u1.id
    LEFT JOIN users u2 ON pp.submitted_by = u2.id
    LEFT JOIN users u3 ON pp.approved_by  = u3.id
    LEFT JOIN users u4 ON pp.locked_by    = u4.id
    WHERE pp.id = ?
");
$stmt->execute([$periodId]);
$period = $stmt->fetch();
if (!$period) {
    setFlash('danger', 'Kỳ lương không tồn tại.');
    header('Location: /erp/modules/payroll/index.php'); exit;
}

$stmtSlips = $pdo->prepare("
    SELECT ps.*,
           u.full_name, u.email, u.employee_code,
           d.name AS department_name
    FROM payroll_slips ps
    JOIN users u ON ps.user_id = u.id
    LEFT JOIN employee_profiles ep ON ep.user_id = u.id
    LEFT JOIN departments d ON u.department_id = d.id
    WHERE ps.period_id = ?
    ORDER BY d.name, u.full_name
");
$stmtSlips->execute([$periodId]);
$slips = $stmtSlips->fetchAll();

$totalGross    = array_sum(array_column($slips, 'gross_salary'));
$totalNet      = array_sum(array_column($slips, 'net_salary'));
$totalSI       = array_sum(array_column($slips, 'si_employee'));
$totalPIT      = array_sum(array_column($slips, 'pit_amount'));
$totalOT       = array_sum(array_column($slips, 'total_ot_amount'));
$totalKpiBonus = array_sum(array_column($slips, 'kpi_bonus'));
$totalKpiDeduct= array_sum(array_column($slips, 'kpi_deduction'));
$totalHousing  = array_sum(array_column($slips, 'housing_received'));
$totalResponsibility = array_sum(array_map(fn($s) => (float)($s['responsibility_allowance_received'] ?? 0), $slips));
$totalSeniority      = array_sum(array_map(fn($s) => (float)($s['seniority_allowance_received'] ?? 0), $slips));
$totalNightWD  = array_sum(array_column($slips, 'ot_night_weekday_amount'));
$totalNightWE  = array_sum(array_column($slips, 'ot_night_weekend_amount'));
$totalNightHL  = array_sum(array_column($slips, 'ot_night_holiday_amount'));
$totalNightBonus = array_sum(array_column($slips, 'night_shift_bonus'));
$warningCount  = count(array_filter($slips, fn($s) => $s['is_late_warning']));

$statusMap = [
    'draft'     => ['secondary', '📝 Nháp'],
    'submitted' => ['warning',   '📤 Chờ duyệt'],
    'approved'  => ['success',   '✅ Đã duyệt'],
    'locked'    => ['dark',      '🔒 Đã lock'],
];
[$sCls, $sLbl] = $statusMap[$period['status']] ?? ['secondary', '?'];
$isLocked = $period['status'] === 'locked';

$csrf = generateCSRF();
include $_SERVER['DOCUMENT_ROOT'] . '/erp/includes/header.php';
include $_SERVER['DOCUMENT_ROOT'] . '/erp/includes/sidebar.php';
?>

<div class="main-content">
<div class="container-fluid py-4">

    <div class="d-flex justify-content-between align-items-start mb-4">
        <div>
            <div class="d-flex align-items-center gap-2 mb-1">
                <a href="/erp/modules/payroll/index.php" class="btn btn-outline-secondary btn-sm">
                    <i class="fas fa-arrow-left"></i>
                </a>
                <h4 class="mb-0">
                    💰 Bảng lương Tháng <?= $period['period_month'] ?>/<?= $period['period_year'] ?>
                </h4>
                <span class="badge bg-<?= $sCls ?> fs-6"><?= $sLbl ?></span>
            </div>
            <div class="ms-5 text-muted small">
                <?= date('d/m/Y', strtotime($period['period_from'])) ?>
                → <?= date('d/m/Y', strtotime($period['period_to'])) ?>
                &nbsp;·&nbsp; <?= $period['working_days'] ?> ngày công chuẩn
                &nbsp;·&nbsp; <?= count($slips) ?> phiếu lương
                <?php if ($warningCount > 0): ?>
                &nbsp;·&nbsp;
                <span class="text-warning fw-bold">
                    <i class="fas fa-exclamation-triangle"></i> <?= $warningCount ?> cảnh báo về sớm
                </span>
                <?php endif; ?>
            </div>
        </div>
        <div class="d-flex gap-2 flex-wrap justify-content-end">
            <?php if (!$isLocked): ?>
            <button class="btn btn-outline-info btn-sm" onclick="recalcAll(<?= $periodId ?>, this)">
                <i class="fas fa-calculator me-1"></i>Tính lại lương
            </button>
            <?php endif; ?>
            <a href="/erp/api/payroll/export_excel.php?period_id=<?= $periodId ?>"
               class="btn btn-success btn-sm">
                <i class="fas fa-file-excel me-1"></i>Xuất Excel
            </a>
            <button class="btn btn-outline-secondary btn-sm" onclick="printTable()">
                <i class="fas fa-print me-1"></i>In bảng lương
            </button>
            <?php if ($period['status'] === 'draft' && hasRole('accountant','director')): ?>
            <button class="btn btn-warning btn-sm" onclick="doWorkflow(<?= $periodId ?>, 'submit', this)">
                <i class="fas fa-paper-plane me-1"></i>Trình GĐ duyệt
            </button>
            <?php endif; ?>
            <?php if ($period['status'] === 'submitted' && hasRole('director')): ?>
            <button class="btn btn-success btn-sm" onclick="doWorkflow(<?= $periodId ?>, 'approve', this)">
                <i class="fas fa-check me-1"></i>Duyệt
            </button>
            <?php endif; ?>
            <?php if ($period['status'] === 'approved' && hasRole('director')): ?>
            <button class="btn btn-dark btn-sm" onclick="doWorkflow(<?= $periodId ?>, 'lock', this)">
                <i class="fas fa-lock me-1"></i>Lock
            </button>
            <?php endif; ?>
            <?php if ($period['status'] === 'locked' && hasRole('director')): ?>
            <button class="btn btn-outline-secondary btn-sm" onclick="doWorkflow(<?= $periodId ?>, 'reopen', this)">
                <i class="fas fa-lock-open me-1"></i>Mở lại
            </button>
            <?php endif; ?>
        </div>
    </div>

    <?php showFlash(); ?>

    <div class="row g-3 mb-4">
        <div class="col-6 col-md-2"><div class="card border-0 shadow-sm text-center py-3"><div class="text-muted small">Tổng Gross</div><div class="fw-bold fs-6 text-primary"><?= number_format($totalGross) ?>₫</div></div></div>
        <div class="col-6 col-md-2"><div class="card border-0 shadow-sm text-center py-3"><div class="text-muted small">Tổng Net</div><div class="fw-bold fs-6 text-success"><?= number_format($totalNet) ?>₫</div></div></div>
        <div class="col-6 col-md-2"><div class="card border-0 shadow-sm text-center py-3"><div class="text-muted small">Tổng OT</div><div class="fw-bold fs-6 text-info"><?= number_format($totalOT) ?>₫</div></div></div>
        <div class="col-6 col-md-2"><div class="card border-0 shadow-sm text-center py-3"><div class="text-muted small">Thưởng KPI</div><div class="fw-bold fs-6 text-success">+<?= number_format($totalKpiBonus) ?>₫</div></div></div>
        <div class="col-6 col-md-2"><div class="card border-0 shadow-sm text-center py-3"><div class="text-muted small">Trừ KPI</div><div class="fw-bold fs-6 text-danger">-<?= number_format($totalKpiDeduct) ?>₫</div></div></div>
        <div class="col-6 col-md-2"><div class="card border-0 shadow-sm text-center py-3"><div class="text-muted small">Tổng BHXH NV</div><div class="fw-bold fs-6 text-warning"><?= number_format($totalSI) ?>₫</div></div></div>
    </div>

    <div class="card border-0 shadow-sm">
        <div class="card-header bg-white border-0 pt-3 d-flex justify-content-between align-items-center">
            <h6 class="fw-bold mb-0">📋 Danh sách phiếu lương</h6>
            <input type="text" id="searchInput" class="form-control form-control-sm" placeholder="🔍 Tìm tên / mã nhân viên..." style="width:250px" onkeyup="filterTable()">
        </div>
        <div class="card-body p-0">
        <?php if (empty($slips)): ?>
            <div class="text-center text-muted py-5">Chưa có phiếu lương nào.</div>
        <?php else: ?>
        <div class="slip-scroll-wrap" id="printArea">
        <table class="slip-table" id="slipTable">
            <thead>
                <tr class="group-row">
                    <th class="sticky-col col-stt" rowspan="2">#</th>
                    <th class="sticky-col col-code" rowspan="2">Mã NV</th>
                    <th class="sticky-col col-name" rowspan="2">Nhân viên</th>
                    <th class="sticky-col col-dept" rowspan="2">Phòng ban</th>
                    <th class="sticky-col col-days" rowspan="2">Ngày công</th>
                    <th class="sticky-col col-basic" rowspan="2">Lương CB</th>
                    <th colspan="6" class="grp-ot">OT</th>
                    <th colspan="5" class="grp-allowance">Trợ cấp</th>
                    <th colspan="6" class="grp-bonus">Phụ cấp & Thưởng</th>
                    <th colspan="2" class="grp-kpi">KPI</th>
                    <th colspan="2" class="grp-leave">Nghỉ phép</th>
                    <th colspan="3" class="grp-deduct">Khấu trừ tự động</th>
                    <th colspan="3" class="grp-manual">Điều chỉnh tay</th>
                    <th class="sticky-col-right col-net" rowspan="2">Thực nhận</th>
                    <th class="sticky-col-right col-act no-print" rowspan="2">Thao tác</th>
                </tr>
                <tr class="detail-row">
                    <th class="grp-ot">Thường</th><th class="grp-ot">CN</th><th class="grp-ot">Lễ</th><th class="grp-ot">🌙 Đêm TT</th><th class="grp-ot">🌙 Đêm CN</th><th class="grp-ot">🌙 Đêm Lễ</th>
                    <th class="grp-allowance">Ăn ca</th><th class="grp-allowance">Trang phục</th><th class="grp-allowance">Điện thoại</th><th class="grp-allowance">Đi lại</th><th class="grp-allowance">Nhà ở</th>
                    <th class="grp-bonus">PC Trách nhiệm</th><th class="grp-bonus">PC Thâm niên</th><th class="grp-bonus">Hiệu quả</th><th class="grp-bonus">Chuyên cần</th><th class="grp-bonus">Thưởng khác</th><th class="grp-bonus">🌙 Phụ trội đêm</th>
                    <th class="grp-kpi text-success">Thưởng KPI</th><th class="grp-kpi text-danger">Trừ KPI</th>
                    <th class="grp-leave">Có lương</th><th class="grp-leave">Không lương</th>
                    <th class="grp-deduct">BHXH</th><th class="grp-deduct">Thuế TNCN</th><th class="grp-deduct">Trừ muộn</th>
                    <th class="grp-manual">Thu nhập khác</th><th class="grp-manual">Điều chỉnh</th><th class="grp-manual">Tạm ứng</th>
                </tr>
            </thead>
            <tbody>
            <?php foreach ($slips as $i => $s): $paidLeave=(float)$s['paid_leave_days']+(float)$s['other_paid_leave_days']; ?>
            <tr>
                <td class="sticky-col col-stt text-center c-muted"><?= $i+1 ?></td>
                <td class="sticky-col col-code text-center"><?= htmlspecialchars($s['employee_code'] ?? '—') ?></td>
                <td class="sticky-col col-name"><?= htmlspecialchars($s['full_name']) ?></td>
                <td class="sticky-col col-dept c-muted"><?= htmlspecialchars($s['department_name'] ?? '—') ?></td>
                <td class="sticky-col col-days text-center fw-semibold"><?= number_format($s['actual_workdays'],1) ?></td>
                <td class="sticky-col col-basic text-end"><?= number_format($s['basic_salary_received']) ?></td>

                <td class="text-end"><?= number_format((float)$s['ot_weekday_amount']) ?></td>
                <td class="text-end"><?= number_format((float)$s['ot_weekend_amount']) ?></td>
                <td class="text-end"><?= number_format((float)$s['ot_holiday_amount']) ?></td>
                <td class="text-end"><?= number_format((float)($s['ot_night_weekday_amount'] ?? 0)) ?></td>
                <td class="text-end"><?= number_format((float)($s['ot_night_weekend_amount'] ?? 0)) ?></td>
                <td class="text-end"><?= number_format((float)($s['ot_night_holiday_amount'] ?? 0)) ?></td>

                <td class="text-end"><?= number_format((float)$s['meal_received']) ?></td>
                <td class="text-end"><?= number_format((float)$s['clothes_received']) ?></td>
                <td class="text-end"><?= number_format((float)$s['phone_received']) ?></td>
                <td class="text-end"><?= number_format((float)$s['transport_received']) ?></td>
                <td class="text-end"><?= number_format((float)$s['housing_received']) ?></td>

                <td class="text-end"><?= number_format((float)($s['responsibility_allowance_received'] ?? 0)) ?></td>
                <td class="text-end"><?= number_format((float)($s['seniority_allowance_received'] ?? 0)) ?></td>
                <td class="text-end"><?= number_format((float)$s['performance_bonus']) ?></td>
                <td class="text-end"><?= number_format((float)$s['attendance_bonus']) ?></td>
                <td class="text-end"><?= number_format((float)$s['other_bonus']) ?></td>
                <td class="text-end"><?= number_format((float)($s['night_shift_bonus'] ?? 0)) ?></td>

                <td class="text-end text-success"><?= number_format((float)$s['kpi_bonus']) ?></td>
                <td class="text-end c-danger"><?= number_format((float)$s['kpi_deduction']) ?></td>

                <td class="text-center"><?= number_format($paidLeave,1) ?></td>
                <td class="text-center"><?= number_format((float)$s['unpaid_leave_days'],1) ?></td>

                <td class="text-end c-danger"><?= number_format((float)$s['si_employee']) ?></td>
                <td class="text-end c-danger"><?= number_format((float)$s['pit_amount']) ?></td>
                <td class="text-end c-danger"><?= number_format((float)$s['late_deduction']) ?></td>

                <td class="text-end"><?= number_format((float)$s['other_income']) ?></td>
                <td class="text-end"><?= number_format((float)$s['adjustment']) ?></td>
                <td class="text-end c-danger"><?= number_format((float)$s['advance_payment']) ?></td>

                <td class="sticky-col-right col-net text-end fw-bold"><?= number_format((float)$s['net_salary']) ?></td>
                <td class="sticky-col-right col-act text-center no-print">—</td>
            </tr>
            <?php endforeach; ?>
            </tbody>
            <tfoot>
                <tr class="foot-row">
                    <td class="sticky-col col-stt"></td><td class="sticky-col col-code"></td><td class="sticky-col col-name">TỔNG CỘNG</td><td class="sticky-col col-dept"><?= count($slips) ?> NV</td><td class="sticky-col col-days text-center">—</td>
                    <td class="sticky-col col-basic text-end"><?= number_format(array_sum(array_column($slips,'basic_salary_received'))) ?></td>
                    <td class="text-end"><?= number_format(array_sum(array_column($slips,'ot_weekday_amount'))) ?></td>
                    <td class="text-end"><?= number_format(array_sum(array_column($slips,'ot_weekend_amount'))) ?></td>
                    <td class="text-end"><?= number_format(array_sum(array_column($slips,'ot_holiday_amount'))) ?></td>
                    <td class="text-end"><?= number_format($totalNightWD) ?></td>
                    <td class="text-end"><?= number_format($totalNightWE) ?></td>
                    <td class="text-end"><?= number_format($totalNightHL) ?></td>
                    <td class="text-end"><?= number_format(array_sum(array_column($slips,'meal_received'))) ?></td>
                    <td class="text-end"><?= number_format(array_sum(array_column($slips,'clothes_received'))) ?></td>
                    <td class="text-end"><?= number_format(array_sum(array_column($slips,'phone_received'))) ?></td>
                    <td class="text-end"><?= number_format(array_sum(array_column($slips,'transport_received'))) ?></td>
                    <td class="text-end"><?= number_format($totalHousing) ?></td>
                    <td class="text-end"><?= number_format($totalResponsibility) ?></td>
                    <td class="text-end"><?= number_format($totalSeniority) ?></td>
                    <td class="text-end"><?= number_format(array_sum(array_column($slips,'performance_bonus'))) ?></td>
                    <td class="text-end"><?= number_format(array_sum(array_column($slips,'attendance_bonus'))) ?></td>
                    <td class="text-end"><?= number_format(array_sum(array_column($slips,'other_bonus'))) ?></td>
                    <td class="text-end"><?= number_format($totalNightBonus) ?></td>
                    <td class="text-end text-success fw-bold">+<?= number_format($totalKpiBonus) ?></td>
                    <td class="text-end c-danger fw-bold">-<?= number_format($totalKpiDeduct) ?></td>
                    <td class="text-center">—</td><td class="text-center">—</td>
                    <td class="text-end"><?= number_format($totalSI) ?></td>
                    <td class="text-end"><?= number_format($totalPIT) ?></td>
                    <td class="text-end"><?= number_format(array_sum(array_column($slips,'late_deduction'))) ?></td>
                    <td class="text-end"><?= number_format(array_sum(array_column($slips,'other_income'))) ?></td>
                    <td class="text-end"><?= number_format(array_sum(array_column($slips,'adjustment'))) ?></td>
                    <td class="text-end"><?= number_format(array_sum(array_column($slips,'advance_payment'))) ?></td>
                    <td class="sticky-col-right col-net text-end"><?= number_format($totalNet) ?></td>
                    <td class="sticky-col-right col-act no-print"></td>
                </tr>
            </tfoot>
        </table>
        </div>
        <?php endif; ?>
        </div>
    </div>
</div>
</div>

<?php include $_SERVER['DOCUMENT_ROOT'] . '/erp/includes/footer.php'; ?>