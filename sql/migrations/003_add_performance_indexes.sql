-- Migration 003: Thêm index tối ưu cho các bảng OQC/IQC
-- Mục đích: cải thiện hiệu suất truy vấn trong module warehouse/OQC

-- Index lọc OQC list theo status và updated_at (query chính trong oqc_list.php)
ALTER TABLE `production_items`
  ADD INDEX `idx_pi_status_updated` (`status`, `updated_at`);

-- Index lọc theo order_id và status (dùng trong production module)
ALTER TABLE `production_items`
  ADD INDEX `idx_pi_order_status` (`order_id`, `status`);

-- Index lọc oqc_deliveries theo ngày giao (delivery_history.php)
ALTER TABLE `oqc_deliveries`
  ADD INDEX `idx_od_delivery_date` (`delivery_date`);

-- Index lọc oqc_deliveries theo status
ALTER TABLE `oqc_deliveries`
  ADD INDEX `idx_od_status` (`status`);

-- Index lọc iqc_receipts theo received_date (iqc_list.php filter)
ALTER TABLE `iqc_receipts`
  ADD INDEX `idx_ir_received_date` (`received_date`);

-- Index lọc iqc_receipts theo status
ALTER TABLE `iqc_receipts`
  ADD INDEX `idx_ir_status` (`status`);
