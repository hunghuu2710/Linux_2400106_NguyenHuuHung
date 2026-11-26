!/bin/bash

SRC_DIR="data"
BAK_DIR="backup"
LOG_FILE="logs/backup.log"

mkdir -p "$BAK_DIR" logs

THOI_GIAN=$(date '+%Y-%m-%d %H:%M:%S')
TEN_FILE="backup_$(date '+%Y%m%d_%H%M%S').tar.gz"
DUONG_DAN="$BAK_DIR/$TEN_FILE"

if [ ! -d "$SRC_DIR" ]; then
    echo "That bai: Thu muc '$SRC_DIR' khong ton tai."
    echo "[$THOI_GIAN] | File: $TEN_FILE | Trang thai: THAT BAI" >> "$LOG_FILE"
    exit 1
fi

if tar -czf "$DUONG_DAN" "$SRC_DIR" 2>/dev/null; then
    echo "Sao luu thanh cong: $DUONG_DAN"
    echo "[$THOI_GIAN] | File: $TEN_FILE | Trang thai: THANH CONG" >> "$LOG_FILE"
else
    echo "Sao luu that bai."
    echo "[$THOI_GIAN] | File: $TEN_FILE | Trang thai: THAT BAI" >> "$LOG_FILE"
    exit 1
fi

echo "--- Danh sach file da sao luu ---"
ls -lh "$BAK_DIR"
echo "Tong so file sao luu: $(ls -1 "$BAK_DIR"/backup_*.tar.gz 2>/dev/null | wc -l)"
