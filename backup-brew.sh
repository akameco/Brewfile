#!/usr/bin/env bash
set -eu

launchctl setenv PATH /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH

BREWFILE_DIR=$GHQ/$USER/Brewfile/

cd $BREWFILE_DIR

brew upgrade
brew bundle dump -f

git add .
git commit -m "Backup `date +"%Y/%m/%d %H:%M:%S"`"
git push origin master

osascript -e 'display notification "Success Backup Brewfile" with title "Backup Brewfile"'
