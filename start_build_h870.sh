#!/bin/bash
set -e

cd ~/LOS18
repo sync -j 16 --force-sync

#cd ~/LOS18/frameworks/base/
#git fetch https://github.com/dom133/android_frameworks_base-1 quartz && git cherry-pick fee9e9d0e97341aaaf6d468834e787129d72e748 && git cherry-pick 6b14318aabd7399515502c3182760efd31e0706b && git cherry-pick dfa33543223f9a9d095bf147f0a40b6be0e493ee


export SELINUX_IGNORE_NEVERALLOWS=true
export TEMPORARY_DISABLE_PATH_RESTRICTIONS=true

cd ~/LOS18

./pick.sh

source build/envsetup.sh
make clobber

brunch lineage_h870-userdebug
