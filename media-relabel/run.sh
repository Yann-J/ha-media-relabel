#!/bin/bash
set -x
ls -la /dev/sdb* /dev/nvme0n1* 2>&1
cat /proc/self/status | grep -i cap
dd if=/dev/sdb1 of=/dev/null bs=4096 count=1 2>&1 || true
e2label /dev/sdb1 plexold && echo "RELABEL_OK" || echo "RELABEL_FAILED"
sync
