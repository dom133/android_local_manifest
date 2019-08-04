#!/bin/bash
cd ~/aex
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
cd ~/aex/frameworks/base/
git fetch https://github.com/LG-G6-DEV/frameworks_base poundcake-release && git cherry-pick 1d00a1ab3bc2c2f4e42f20e0877c4df38dec79d0

export SELINUX_IGNORE_NEVERALLOWS=true

cd ~/aex
. build/envsetup.sh
make clean
sudo rm -rf /var/www/html/*

export WITH_GAPPS=true
lunch aosp_h870-userdebug
mka aex -j$(nproc --all)
sudo cp ~/aex/out/target/product/h870/AospExtended-*-h870-*.zip /var/www/html/
rm ~/aex/out/target/product/h870/AospExtended-*-h870-*.zip

cd ~/
./upload-beta.sh
