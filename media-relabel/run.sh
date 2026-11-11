#!/bin/bash
set -x
mount -o ro /dev/sdb1 /mnt/old || exit 1
ls -la /mnt/old
du -sh /mnt/old/* 2>/dev/null
echo === MEDIA CANDIDATES ===
for d in /mnt/old/supervisor/media /mnt/old/media /mnt/old/upper/supervisor/media; do
  [ -d "$d" ] && du -sh "$d" && ls "$d" | head -20
done
echo === SPEED TEST (read 2GB) ===
dd if=/dev/sdb1 of=/dev/null bs=1M count=2048 skip=1 status=progress
umount /mnt/old
