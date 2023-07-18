#!/Bin/Bash

clear

# disk_id="$(diskutil info 'Macintosh HD' |grep Node | awk  '{print $3}')"
disk_id=/dev/disk0

echo "==============================="
echo "|                             |"
echo "|    macOS Profile Remover    |"
echo "|                             |"
echo "==============================="
echo ""
echo "Checking for Device ID..."
echo ""

if [[ -z "$disk_id" ]]; then
  echo "Error!, Device not found!"
elif [[ -n "$disk_id" ]]; then
  echo "Found: $disk_id"
  echo ""
  echo "Scanning old profiles"
  sleep 2
  echo ""
  echo "Mounting Drive"
  echo ""
  hdiutil mount $disk_id
  sleep 2
  echo ""
  echo "Removing profiles..."
  rm -rf /Volumes/Macintosh\ HD/Users/130*
  rm -rf /Volumes/Macintosh\ HD/Users/s2*
  rm -rf /Volumes/Macintosh\ HD/Users/s3*
  echo ""
  echo "============================================"
  echo "|       Profile removals completed         |"
  echo "|      Rebooting Mac in 3 seconds...       |"
  echo "============================================"
  echo ""
  sleep 3
  # /sbin/shutdown -r now
else
  echo "ERROR! Something went wrong."
  exit 1
fi

