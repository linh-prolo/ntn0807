# NTN ERP System

Hệ thống ERP nội bộ quản lý kho, sản xuất, nhân sự, lương, hóa đơn.

---

## Kiến trúc sau refactor

```
/
├── api/           # Endpoint API thuần JSON (không có HTML)
│   ├── warehouse/ # Kho/OQC/IQC/Giao hàng
│   ├── production/
│   ├── invoice/
│   ├── master/
│   ├── salary/
│   ├── payroll/
│   ├── admin/
│   ├── attendance/
│   └── reports/
├── modules/       # View PHP (trả HTML, dùng include header/sidebar/footer)
├── config/
│   ├── auth.php       # Xác thực & phân quyền (hàm web + api)
│   ├── functions.php  # Tiện ích, CSRF, flash, helpers
│   └── database.php   # Kết nối PDO
├── includes/      # header.php, sidebar.php, footer.php, 403.php
├── sql/
│   ├── *.sql           # Schema dump
│   └── migrations/     # Migration theo thứ tự 001, 002, 003...
└── assets/        # CSS, JS dùng chung
```

---

## Quy ước API JSON

Mọi file trong `api/` **phải**:

1. Set header trước khi output:
   ```php
   header('Content-Type: application/json');
   ```

2. Dùng hàm API-safe cho xác thực (không redirect/HTML):
   ```php
   requireLoginApi();              // 401 JSON nếu chưa đăng nhập
   requireRoleApi('director',...); // 403 JSON nếu sai quyền
   ensurePostCsrfApi();            // 403 JSON nếu CSRF không hợp lệ
   ```

3. Luôn trả JSON với cấu trúc:
   ```json
   { "ok": true,  "data": ... }   // thành công
   { "ok": false, "msg": "..."  } // lỗi
   ```

4. Không include file HTML (`header.php`, `403.php`...) trong context API.

---

## Quy tắc tính toán (OQC/Kho)

### production_items
| Trường | Ý nghĩa |
|---|---|
| `qty_total` | Tổng SL nhập từ IQC |
| `qty_done` | SL hoàn thành sản xuất |
| `qty_error` | SL lỗi phát sinh |
| `qty_pending` | `qty_total - qty_done - qty_error` (tính tại query time) |

### oqc_delivery_items
| Trường | Ý nghĩa |
|---|---|
| `qty_deliver` | SL đã giao trong phiếu này |
| `type` | `done` = thành phẩm / `error` = trả lại lỗi |

### Số lượng có thể giao (oqc_delivery.php)
```
available_done  = qty_done  - SUM(qty_deliver WHERE type='done')
available_error = qty_error - SUM(qty_deliver WHERE type='error')
```

### Trạng thái production_items
- `in_progress` — đang sản xuất
- `done` — hoàn thành (qty_done > 0)
- `error` — có lỗi (qty_error > 0)

---

## Hướng dẫn Migration

Chạy các file trong `sql/migrations/` **theo thứ tự số**:

```bash
mysql -u <user> -p <database> < sql/migrations/001_add_created_at_production_items.sql
mysql -u <user> -p <database> < sql/migrations/002_add_fk_constraints_oqc_iqc_production.sql
mysql -u <user> -p <database> < sql/migrations/003_add_performance_indexes.sql
```

**Trước khi chạy migration 002** (FK constraints), kiểm tra không có orphan records:
```sql
SELECT * FROM iqc_receipt_items WHERE receipt_id NOT IN (SELECT id FROM iqc_receipts);
SELECT * FROM production_items WHERE order_id NOT IN (SELECT id FROM production_orders);
SELECT * FROM oqc_delivery_items WHERE delivery_id NOT IN (SELECT id FROM oqc_deliveries);
SELECT * FROM oqc_delivery_items WHERE production_item_id NOT IN (SELECT id FROM production_items);
```

---

## Roles & Quyền

| Role | Mô tả |
|---|---|
| `director` | Giám đốc — toàn quyền |
| `accountant` | Kế toán |
| `manager` | Quản lý |
| `warehouse` | Quản lý Kho |
| `production` | Quản lý Sản xuất |
| `employee` | Nhân viên |

---

## Luồng OQC

```
Nhập hàng (IQC) → Sản xuất (production_items cập nhật qty_done/qty_error)
→ Kho thành phẩm (oqc_list.php) → Tạo phiếu xuất (oqc_delivery.php)
→ Phiếu giao hàng (oqc_deliveries + oqc_delivery_items)
→ Lịch sử giao hàng (delivery_history.php)
```

