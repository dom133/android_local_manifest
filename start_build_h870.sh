#!/bin/bash

cd ~/PA
repo sync -j 16 --force-sync

cd ~/PA/frameworks/base/
git fetch https://github.com/dom133/android_frameworks_base-1 quartz && git cherry-pick fee9e9d0e97341aaaf6d468834e787129d72e748 && git cherry-pick 6b14318aabd7399515502c3182760efd31e0706b && git cherry-pick dfa33543223f9a9d095bf147f0a40b6be0e493ee

cd ~/PA/device/lge/h870/
git fetch https://gitlab.com/dom133/android_device_lge_h870 quartz_3.0 && git cherry-pick 99cc394d14db773d9efb2f5ec74e3b8234f753c6

export SELINUX_IGNORE_NEVERALLOWS=true
export TARGET_DISABLES_GAPPS=true
export TEMPORARY_DISABLE_PATH_RESTRICTIONS=true

cd ~/PA
rm -rf ~/builds/roms/pa/*

source build/envsetup.sh
make clobber

repopick 13402

./rom-build.sh h870

cp ~/PA/out/target/product/h870/pa-quartz*-h870-*.zip ~/builds/roms/pa/
