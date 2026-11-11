#!/bin/bash
set -x
debugfs -R "ls -l /" /dev/sdb1 2>/dev/null
echo === supervisor ===
debugfs -R "ls -l /supervisor" /dev/sdb1 2>/dev/null
echo === media ===
debugfs -R "ls -l /supervisor/media" /dev/sdb1 2>/dev/null | head -40
