#!/bin/bash

cd ~/PA
repo sync -j 16 --force-sync

cd ~/PA/frameworks/base/
git fetch https://github.com/dom133/android_frameworks_base-1 quartz && git cherry-pick fee9e9d0e97341aaaf6d468834e787129d72e748 && git cherry-pick 0adea9271fb22bdb5f02d02839bf4f68f961e3f9

export SELINUX_IGNORE_NEVERALLOWS=true
export TARGET_DISABLES_GAPPS=true
export TEMPORARY_DISABLE_PATH_RESTRICTIONS=true

cd ~/PA
rm -rf ~/builds/roms/pa/*

source build/envsetup.sh
make clobber

./rom-build.sh h870

cp ~/PA/out/target/product/h870/pa-quartz*-h870-*.zip ~/builds/roms/pa/
