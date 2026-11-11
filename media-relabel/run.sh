#!/bin/bash
set -x
# Relabel the old data partition so Supervisor allows mounting it
e2label /dev/sdb1 plexold && echo "RELABEL_OK" || echo "RELABEL_FAILED"
sync
