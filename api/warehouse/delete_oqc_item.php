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

    // Delete delivery items referencing this production item
    $pdo->prepare('DELETE FROM oqc_delivery_items WHERE production_item_id = ?')
        ->execute([$id]);

    // Delete the production item itself
    $pdo->prepare('DELETE FROM production_items WHERE id = ?')
        ->execute([$id]);

    $pdo->commit();
    echo json_encode(['ok' => true]);

} catch (Throwable $e) {
    if ($pdo->inTransaction()) {
        $pdo->rollBack();
    }
    error_log('[delete_oqc_item] ' . $e->getMessage());
    echo json_encode(['ok' => false, 'msg' => 'Lỗi xoá mục OQC']);
}
