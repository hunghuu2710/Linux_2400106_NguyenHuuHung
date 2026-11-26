#!/bin/bash

DATA_FILE="data/sinhvien.txt"

if [ ! -f "$DATA_FILE" ]; then
    echo "Loi: Khong tim thay file du lieu $DATA_FILE"
    exit 1
fi

while true; do
    echo ""
    echo "===== CHUONG TRINH QUAN LY SINH VIEN ====="
    echo "1. Hien thi danh sach sinh vien"
    echo "2. Tim kiem sinh vien theo ma"
    echo "3. Thong ke sinh vien dat va khong dat"
    echo "4. Tinh diem trung binh"
    echo "5. Hien thi sinh vien co diem cao nhat"
    echo "6. Sap xep sinh vien theo diem giam dan"
    echo "0. Thoat chuong trinh"
    read -r -p "Nhap lua chon: " chon

    case "$chon" in
        1)
            echo "--- Danh sach sinh vien ---"
            awk -F',' 'NF>=3 {printf "Ma: %s | Ho ten: %s | Diem: %.1f\n", $1, $2, $3}' "$DATA_FILE"
            ;;
        2)
            read -r -p "Nhap ma sinh vien can tim: " masv
            kq=$(awk -F',' -v m="$masv" 'tolower($1)==tolower(m) {printf "Ma: %s | Ho ten: %s | Diem: %.1f\n", $1, $2, $3}' "$DATA_FILE")
            if [ -n "$kq" ]; then
                echo "$kq"
            else
                echo "Khong tim thay sinh vien co ma: $masv"
            fi
            ;;
        3)
            awk -F',' '
                NF>=3 && $3 >= 5 { dat++ }
                NF>=3 && $3 < 5  { truot++ }
                END {
                    printf "So sinh vien dat (diem >= 5)    : %d\n", dat+0
                    printf "So sinh vien khong dat (diem < 5): %d\n", truot+0
                }' "$DATA_FILE"
            ;;
        4)
            awk -F',' '
                NF>=3 { tong += $3; dem++ }
                END {
                    if (dem > 0) printf "Diem trung binh: %.2f\n", tong/dem
                    else print "Khong co du lieu"
                }' "$DATA_FILE"
            ;;
        5)
            max_d=$(awk -F',' 'NF>=3 {if ($3>m || NR==1) m=$3} END {print m}' "$DATA_FILE")
            echo "--- Sinh vien diem cao nhat ($max_d) ---"
            awk -F',' -v max="$max_d" 'NF>=3 && $3==max {printf "Ma: %s | Ho ten: %s | Diem: %.1f\n", $1, $2, $3}' "$DATA_FILE"
            ;;
        6)
            echo "--- Danh sach sap xep theo diem giam dan ---"
            sort -t',' -k3,3nr "$DATA_FILE" | awk -F',' 'NF>=3 {printf "Ma: %s | Ho ten: %s | Diem: %.1f\n", $1, $2, $3}'
            ;;
        0)
            echo "Thoat chuong trinh."
            break
            ;;
        *)
            echo "Lua chon khong hop le! Vui long nhap tu 0 den 6."
            ;;
    esac
done
