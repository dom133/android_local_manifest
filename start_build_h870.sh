#!/bin/bash
cd ~/omni
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
cd ~/omni/frameworks/base/
git fetch https://github.com/LG-G6-DEV/havoc_frameworks_base ten && git cherry-pick 794cb90533137816436ccd26ff2e04947fb12e31

export SELINUX_IGNORE_NEVERALLOWS=true

cd ~/omni
. build/envsetup.sh
make clobber
brunch omni_h870-userdebug
