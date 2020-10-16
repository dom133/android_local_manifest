#!/bin/bash

cd ~/PA-RUBY
repo sync -c --no-clone-bundle --current-branch --no-tags -j 16 --force-sync

#cd ~/PA/frameworks/base/
#git fetch https://github.com/dom133/android_frameworks_base-1 quartz && git cherry-pick fee9e9d0e97341aaaf6d468834e787129d72e748 && git cherry-pick 6b14318aabd7399515502c3182760efd31e0706b && git cherry-pick dfa33543223f9a9d095bf147f0a40b6be0e493ee

#cd ~/PA/device/lge/h870/
#git fetch https://gitlab.com/dom133/android_device_lge_h870 quartz_3.0 && git cherry-pick e11910227c843de22f308e68782b368c40329905

export SELINUX_IGNORE_NEVERALLOWS=true
export TARGET_DISABLES_GAPPS=true
export TEMPORARY_DISABLE_PATH_RESTRICTIONS=true

cd ~/PA-RUBY
#rm -rf ~/builds/roms/pa/*

source build/envsetup.sh
make clobber

#repopick 13402

repopick 15125
repopick 15123
repopick 15124

./rom-build.sh h870

#cp ~/PA/out/target/product/h870/pa-quartz*-h870-*.zip ~/builds/roms/pa/
