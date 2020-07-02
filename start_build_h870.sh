#!/bin/bash
set -e

cd ~/PA
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

cd ~/PA/frameworks/base/
git fetch https://github.com/LG-G6-DEV/havoc_frameworks_base ten && git cherry-pick 794cb90533137816436ccd26ff2e04947fb12e31

cd ~/PA/device/lge/msm8996-common
git fetch https://github.com/LG-G6-DEV/android_device_lge_msm8996-common.git opt && git cherry-pick a7afd63c2f0db20043d9f1b6519b295754824d6c
git cherry-pick 133ae7c6e44db2dc3f712d7c3dba778cad253870 && git cherry-pick c700cde9ca4bd3e696d20bd6929499a713f69cab

export SELINUX_IGNORE_NEVERALLOWS=true
export TARGET_DISABLES_GAPPS=true
export TEMPORARY_DISABLE_PATH_RESTRICTIONS=true

cd ~/PA
rm -rf ~/builds/roms/pa/*

source build/envsetup.sh
make clobber

./rom-build.sh -c h870

cp ~/PA/out/target/product/h870/pa-quartz*-h870-*.zip ~/builds/roms/pa/
