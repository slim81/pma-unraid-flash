#!/bin/bash
REPO=/mnt/user/system/flash-backup
rsync -a --delete --exclude='.git' /boot/config/ "$REPO/config/"
cd "$REPO" || exit 1
git add -A
git diff --cached --quiet && exit 0
git commit -m "flash backup $(hostname) $(date +%F_%H%M)"
git push origin master
