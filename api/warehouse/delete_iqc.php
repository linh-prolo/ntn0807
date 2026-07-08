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

    // Find iqc_receipt_items linked to this receipt
    $stmt = $pdo->prepare('SELECT id FROM iqc_receipt_items WHERE receipt_id = ?');
    $stmt->execute([$id]);
    $iqcItemIds = $stmt->fetchAll(PDO::FETCH_COLUMN);

    if ($iqcItemIds) {
        $ph = implode(',', array_fill(0, count($iqcItemIds), '?'));

        // Find production_items linked to those iqc items
        $stmt2 = $pdo->prepare("SELECT id FROM production_items WHERE iqc_item_id IN ($ph)");
        $stmt2->execute($iqcItemIds);
        $prodItemIds = $stmt2->fetchAll(PDO::FETCH_COLUMN);

        if ($prodItemIds) {
            $ph2 = implode(',', array_fill(0, count($prodItemIds), '?'));
            // Delete delivery items referencing those production items
            $pdo->prepare("DELETE FROM oqc_delivery_items WHERE production_item_id IN ($ph2)")
                ->execute($prodItemIds);
            // Delete production items
            $pdo->prepare("DELETE FROM production_items WHERE id IN ($ph2)")
                ->execute($prodItemIds);
        }

        // Delete iqc_receipt_items
        $pdo->prepare("DELETE FROM iqc_receipt_items WHERE receipt_id = ?")
            ->execute([$id]);
    }

    // Delete production_orders linked to this receipt
    $pdo->prepare('DELETE FROM production_orders WHERE iqc_receipt_id = ?')
        ->execute([$id]);

    // Delete the iqc_receipt itself
    $pdo->prepare('DELETE FROM iqc_receipts WHERE id = ?')
        ->execute([$id]);

    $pdo->commit();
    echo json_encode(['ok' => true]);

} catch (Throwable $e) {
    if ($pdo->inTransaction()) {
        $pdo->rollBack();
    }
    error_log('[delete_iqc] ' . $e->getMessage());
    echo json_encode(['ok' => false, 'msg' => 'Lỗi xoá phiếu IQC']);
}
