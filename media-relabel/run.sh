#!/bin/bash
set -x
DEST=/media/media
DEV=/dev/sdb1
for name in "Movies" "TV Shows" "Misc"; do
  marker="$DEST/.done_$(echo "$name" | tr ' ' '_')"
  if [ -f "$marker" ]; then echo "SKIP (done): $name"; continue; fi
  echo "=== COPYING: $name ==="
  rm -rf "$DEST/$name"
  debugfs -R "rdump \"/supervisor/media/$name\" \"$DEST\"" "$DEV" 2>&1 | tail -5
  rc=$?
  if [ $rc -eq 0 ] && [ -d "$DEST/$name" ]; then
    touch "$marker"
    echo "DONE: $name"
    du -sh "$DEST/$name"
  else
    echo "FAILED: $name (rc=$rc)"
  fi
done
echo "=== ALL FINISHED ==="
du -sh "$DEST"
