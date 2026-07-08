<?php
require_once $_SERVER['DOCUMENT_ROOT'] . '/erp/config/database.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/erp/config/auth.php';
require_once $_SERVER['DOCUMENT_ROOT'] . '/erp/config/functions.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    header('Content-Type: application/json');
    echo json_encode(['ok' => false, 'msg' => 'Method not allowed']);
    exit;
}

header('Content-Type: application/json');
requireLogin();
requireRole('director');
ensurePostCsrf();

$id = (int)($_POST['id'] ?? 0);
if ($id <= 0) {
    echo json_encode(['ok' => false, 'msg' => 'ID không hợp lệ']);
    exit;
}

$pdo = getDBConnection();

try {
    $pdo->beginTransaction();

    // Delete delivery items first
    $pdo->prepare('DELETE FROM oqc_delivery_items WHERE delivery_id = ?')
        ->execute([$id]);

    // Delete the delivery record
    $pdo->prepare('DELETE FROM oqc_deliveries WHERE id = ?')
        ->execute([$id]);

    $pdo->commit();
    echo json_encode(['ok' => true]);

} catch (Throwable $e) {
    if ($pdo->inTransaction()) {
        $pdo->rollBack();
    }
    error_log('[delete_delivery] ' . $e->getMessage());
    echo json_encode(['ok' => false, 'msg' => 'Lỗi xoá phiếu giao hàng']);
}
