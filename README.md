# Bài Kiểm Tra Thực Hành: Linux và Lập Trình Mã Nguồn Mở

- **Họ và tên:** Nguyen Huu Hung
- **MSSV:** 2400106
- **Lớp:** K4828CNTT1

## Giới thiệu
Bài thực hành sử dụng Linux/WSL2, Bash Shell Script và Git/GitHub để quản lý tệp/thư mục, giám sát hệ thống, xử lý dữ liệu sinh viên và sao lưu dữ liệu.

## Chức năng các script
- `scripts/hethong.sh`: In thông tin người dùng, máy tính, thời gian, kernel, RAM, ổ đĩa, kiểm tra mạng tới `google.com.vn` và ghi vào `logs/hethong.log`.
- `scripts/quanlysv.sh`: Menu quản lý danh sách sinh viên từ `data/sinhvien.txt` (xem, tìm theo mã, thống kê đạt/không đạt, điểm trung bình, điểm cao nhất, sắp xếp giảm dần).
- `scripts/saoluu.sh`: Kiểm tra thư mục `data`, nén `.tar.gz` vào `backup/`, ghi log vào `logs/backup.log` và liệt kê file sao lưu.

## Hướng dẫn cấp quyền và chạy
chmod +x scripts/*.sh
./scripts/hethong.sh
./scripts/quanlysv.sh
./scripts/saoluu.sh

## Kết quả thực hiện
Đã tạo đầy đủ thư mục, phân quyền `640` cho `data/sinhvien.txt`, chạy thành công các script, tạo file log và file nén sao lưu, quản lý commit/nhánh trên Git và đẩy lên GitHub.
