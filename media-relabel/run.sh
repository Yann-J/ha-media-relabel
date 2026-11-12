#!/bin/bash
set -x
cd /media
ln -sfn media/Movies Movies
ln -sfn "media/TV Shows" "TV Shows"
ln -sfn media/Misc Misc
ls -la /media/
echo SYMLINKS_OK
