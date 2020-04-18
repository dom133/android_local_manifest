#!/bin/bash
cd ~/PA
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

cd ~/PA/frameworks/base/
git fetch https://github.com/LG-G6-DEV/havoc_frameworks_base ten && git cherry-pick 794cb90533137816436ccd26ff2e04947fb12e31

cd ~/PA/hardware/qcom/display
git fetch "https://github.com/LineageOS/android_hardware_qcom_display" refs/changes/64/272664/1 && git cherry-pick FETCH_HEAD

export SELINUX_IGNORE_NEVERALLOWS=true

cd ~/PA
rm -rf ~/builds/*

source build/envsetup.sh

./rom-build.sh -c h870

cp ~/PA/out/target/product/h870/pa-quartz-beta-*-h870-*.zip ~/builds/
