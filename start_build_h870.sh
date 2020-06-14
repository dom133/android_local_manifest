#!/bin/bash
set -e

cd ~/AEX
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

cd ~/AEX/frameworks/base/
git fetch https://github.com/LG-G6-DEV/havoc_frameworks_base ten && git cherry-pick 794cb90533137816436ccd26ff2e04947fb12e31

export SELINUX_IGNORE_NEVERALLOWS=true
export WITH_GAPPS=false
export TEMPORARY_DISABLE_PATH_RESTRICTIONS=true

cd ~/AEX

. build/envsetup.sh
make clobber

cd ~/AEX/

lunch aosp_h870-userdebug
make depmod
mka aex -j$(nproc --all) | tee log.txt
