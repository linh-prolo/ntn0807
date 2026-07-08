-- Migration 002: Thêm FK constraints cho các bảng OQC/IQC/Production
-- Mục đích: đảm bảo toàn vẹn tham chiếu, tránh orphan records.
-- Lưu ý: chạy sau khi xác nhận không có dữ liệu orphan hiện tại.
-- Kiểm tra trước khi chạy:
--   SELECT * FROM iqc_receipt_items WHERE receipt_id NOT IN (SELECT id FROM iqc_receipts);
--   SELECT * FROM production_items WHERE order_id NOT IN (SELECT id FROM production_orders);
--   SELECT * FROM production_orders WHERE iqc_receipt_id NOT IN (SELECT id FROM iqc_receipts);
--   SELECT * FROM oqc_delivery_items WHERE delivery_id NOT IN (SELECT id FROM oqc_deliveries);
--   SELECT * FROM oqc_delivery_items WHERE production_item_id NOT IN (SELECT id FROM production_items);

-- IQC: iqc_receipt_items → iqc_receipts
ALTER TABLE `iqc_receipt_items`
  ADD CONSTRAINT `fk_iri_receipt`
    FOREIGN KEY (`receipt_id`) REFERENCES `iqc_receipts` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE;

-- IQC: iqc_receipt_items → product_codes
ALTER TABLE `iqc_receipt_items`
  ADD CONSTRAINT `fk_iri_product_code`
    FOREIGN KEY (`product_code_id`) REFERENCES `product_codes` (`id`)
    ON UPDATE CASCADE;

-- Production: production_orders → iqc_receipts
ALTER TABLE `production_orders`
  ADD CONSTRAINT `fk_po_iqc_receipt`
    FOREIGN KEY (`iqc_receipt_id`) REFERENCES `iqc_receipts` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE;

-- Production: production_items → production_orders
ALTER TABLE `production_items`
  ADD CONSTRAINT `fk_pi_order`
    FOREIGN KEY (`order_id`) REFERENCES `production_orders` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE;

-- Production: production_items → iqc_receipt_items
ALTER TABLE `production_items`
  ADD CONSTRAINT `fk_pi_iqc_item`
    FOREIGN KEY (`iqc_item_id`) REFERENCES `iqc_receipt_items` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE;

-- OQC Delivery: oqc_deliveries → customers
ALTER TABLE `oqc_deliveries`
  ADD CONSTRAINT `fk_od_customer`
    FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
    ON UPDATE CASCADE;

-- OQC Delivery Items: oqc_delivery_items → oqc_deliveries
ALTER TABLE `oqc_delivery_items`
  ADD CONSTRAINT `fk_odi_delivery`
    FOREIGN KEY (`delivery_id`) REFERENCES `oqc_deliveries` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE;

-- OQC Delivery Items: oqc_delivery_items → production_items
ALTER TABLE `oqc_delivery_items`
  ADD CONSTRAINT `fk_odi_prod_item`
    FOREIGN KEY (`production_item_id`) REFERENCES `production_items` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE;
