#!/bin/bash

mkdir -p logs
LOG_FILE="logs/hethong.log"

{
    echo "=== THONG TIN HE THONG ==="
    echo "Ten nguoi dung : $(whoami)"
    echo "Ten may tinh   : $(hostname)"
    echo "Ngay gio       : $(date '+%Y-%m-%d %H:%M:%S')"
    echo "Linux Kernel   : $(uname -r)"
    echo ""

    echo "=== DUNG LUONG RAM ==="
    free -h
    echo ""

    echo "=== DUNG LUONG O DIA ==="
    df -h
    echo ""

    echo "=== KIEM TRA KET NOI MANG ==="
    if ping -c 2 -W 3 google.com.vn > /dev/null 2>&1; then
        echo "Co ket noi mang"
    else
        echo "Khong xac nhan duoc ket noi mang"
    fi
    echo ""
} | tee -a "$LOG_FILE"
