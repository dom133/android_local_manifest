#!/bin/bash
set -e

cd ~/AEX
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

cd ~/AEX/frameworks/base/
git fetch https://github.com/dom133/android_frameworks_base-1 quartz && git cherry-pick fee9e9d0e97341aaaf6d468834e787129d72e748

cd ~/AEX/kernel/lge/msm8996
git revert 856649b97537f0a24dc7d1e27e08baeafd6784c1 --no-edit
git revert cc655c81264d495f074c3a8d5addd1978fd0e78d --no-edit
git revert f223176ff5508bef2b291a6cf8f64119f47a807e --no-edit

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
