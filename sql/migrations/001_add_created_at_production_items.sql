-- Migration 001: Thêm cột created_at vào production_items
-- production_items hiện tại chỉ có updated_at (ON UPDATE current_timestamp)
-- nhưng thiếu created_at để ghi lại thời điểm tạo ban đầu.
-- An toàn để chạy: chỉ thêm cột với DEFAULT, không ảnh hưởng dữ liệu cũ.

ALTER TABLE `production_items`
  ADD COLUMN `created_at` timestamp NOT NULL DEFAULT current_timestamp()
  AFTER `updated_by`;

-- Backfill: gán created_at = updated_at cho các bản ghi cũ (xấp xỉ)
UPDATE `production_items` SET `created_at` = `updated_at` WHERE `created_at` = '0000-00-00 00:00:00' OR `created_at` IS NULL;
