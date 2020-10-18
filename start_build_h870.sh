#!/bin/bash
set -e

cd ~/R11.0
repo sync -c --force-sync --no-tags --no-clone-bundle -j16 --optimized-fetch --prune

#cd ~/LOS18/frameworks/base/
#git fetch https://github.com/dom133/android_frameworks_base-1 quartz && git cherry-pick fee9e9d0e97341aaaf6d468834e787129d72e748 && git cherry-pick 6b14318aabd7399515502c3182760efd31e0706b && git cherry-pick dfa33543223f9a9d095bf147f0a40b6be0e493ee


export SELINUX_IGNORE_NEVERALLOWS=true
export TEMPORARY_DISABLE_PATH_RESTRICTIONS=true

cd ~/R11.0/kernel/lge/msm8996
git revert ee6d2bb3f3360acefae265fdcb03ee7388e9077b --no-edit
git revert 856649b97537f0a24dc7d1e27e08baeafd6784c1 --no-edit
git revert cc655c81264d495f074c3a8d5addd1978fd0e78d --no-edit
git revert f223176ff5508bef2b291a6cf8f64119f47a807e --no-edit

cd ~/R11.0

source build/envsetup.sh
lunch revengeos_h870-userdebug

make clobber
make bacon
