#!/bin/bash

clear

# CPU model
CPU_MODEL="$(sysctl -n machdep.cpu.brand_string 2>/dev/null)"

# Model Identifier (e.g., MacBookPro18,2)
MODEL_ID="$(sysctl -n hw.model 2>/dev/null)"

# Model Number (e.g., MPHH3B/A)
MODEL_NUMBER="$(system_profiler SPHardwareDataType | grep "Model Number" | awk '{print $3}')"

# Model Name (user‑friendly)
MODEL_NAME="$(system_profiler SPHardwareDataType | awk -F': ' '/Model Name/{print $2}')"

# Memory (in GB, properly calculated)
MEM_BYTES="$(sysctl -n hw.memsize 2>/dev/null)"
MEMORY_SIZE="$(echo "$MEM_BYTES / 1024 / 1024 / 1024" | bc)"

# macOS version
MAC_OS_VERSION="$(sw_vers -productVersion)"

# Serial number (Apple‑approved method)
SERIAL_NUMBER="$(system_profiler SPHardwareDataType | awk -F': ' '/Serial Number/{print $2}')"

# Primary disk (works on Apple Silicon + Intel)
MAIN_DISK="$(diskutil info / | awk -F': *' '/Device Identifier/{print $2}')"

# Disk size (clean GB reporting)
DISK_SIZE="$(diskutil info "$MAIN_DISK" | awk -F': *' '/Disk Size/{print $2}' | awk '{print $1, $2}')"

# SSD check (returns Yes/No)
SSD_CHECK="$(diskutil info "$MAIN_DISK" | awk -F': *' '/Solid State/{print $2}')"

# IP address (Wi-Fi or Ethernet automatically)
IP_ADDRESS="$(ipconfig getifaddr en0 2>/dev/null)"
if [[ -z "$IP_ADDRESS" ]]; then
    IP_ADDRESS="$(ipconfig getifaddr en1 2>/dev/null)"
fi
[ -z "$IP_ADDRESS" ] && IP_ADDRESS="Not Connected"

echo ""
echo "  __  __              ___        __        "
echo " |  \/  | __ _  ___  |_ _|_ __  / _| ___   "
echo " | |\/| |/ _  |/ __|  | ||  _ \| |_ / _ \  "
echo " | |  | | (_| | (__   | || | | |  _| (_) | "
echo " |_|  |_|\__,_|\___| |___|_| |_|_|  \___/  "
echo "                                           "
echo "             Craig Barrington              "
echo ""
echo "==========================================="
echo ""
echo "Model Name:     $MODEL_NAME"
echo "Model Number:   $MODEL_NUMBER"
echo "Model ID:       $MODEL_ID"
echo ""
echo "CPU Model:      $CPU_MODEL"
echo "Memory:         ${MEMORY_SIZE} GB"
echo "Disk:           $DISK_SIZE"
echo "SSD:            $SSD_CHECK"
echo "OS Version:     $MAC_OS_VERSION"
echo ""
echo "Serial Number:  $SERIAL_NUMBER"
echo "IP Address:     $IP_ADDRESS"
echo ""
echo "==========================================="
echo ""

exit 0
