#!/bin/bash
cd ~/aex
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
cd ~/aex/frameworks/base/
git fetch https://github.com/LG-G6-DEV/havoc_frameworks_base ten && git cherry-pick 794cb90533137816436ccd26ff2e04947fb12e31

export SELINUX_IGNORE_NEVERALLOWS=true

cd ~/aex
. build/envsetup.sh
make clobber
sudo rm -rf ~/builds/*

export WITH_GAPPS=false
cd ~/aex/
lunch aosp_h870-userdebug
make depmod
mka aex -j$(nproc --all)
sudo cp ~/aex/out/target/product/h870/AospExtended-*-h870-*.zip ~/builds/

export WITH_GAPPS=false
cd ~/aex/
lunch aosp_h872-userdebug
mka aex -j$(nproc --all)
sudo cp ~/aex/out/target/product/h872/AospExtended-*-h872-*.zip ~/builds/

export WITH_GAPPS=false
cd ~/aex/
lunch aosp_us997-userdebug
mka aex -j$(nproc --all)
sudo cp ~/aex/out/target/product/us997/AospExtended-*-us997-*.zip /home/dom133/builds/
