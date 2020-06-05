#!/bin/bash
set -e 

cd ~/PA
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

cd ~/PA/frameworks/base/
git fetch https://github.com/LG-G6-DEV/havoc_frameworks_base ten && git cherry-pick 794cb90533137816436ccd26ff2e04947fb12e31

export SELINUX_IGNORE_NEVERALLOWS=true
export TARGET_DISABLES_GAPPS=true

cd ~/PA
rm -rf ~/builds/roms/pa/*

source build/envsetup.sh
make clobber

./rom-build.sh -c h870
mv ~/PA/out/target/product/h870/pa-quartz*-h870-*.zip ~/builds/roms/pa/

./rom-build.sh -c h872
mv ~/PA/out/target/product/h872/pa-quartz*-h872-*.zip ~/builds/roms/pa/

./rom-build.sh -c us997
mv ~/PA/out/target/product/us997/pa-quartz*-us997-*.zip ~/builds/roms/pa/

cd ~/
./upload_pa_build.sh
