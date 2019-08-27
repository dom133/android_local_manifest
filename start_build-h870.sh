#!/bin/bash
cd ~/aex
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
cd ~/aex/frameworks/base/
git fetch https://github.com/LG-G6-DEV/frameworks_base poundcake-release && git cherry-pick 1d00a1ab3bc2c2f4e42f20e0877c4df38dec79d0
git revert 3ac97adb9b63b4f69f9ddfc9b9af04abbd0becb5
git revert d5a0217ac1dcf1c432850e865b2f12deadc0c893 
git revert 8f85a834a4f1695c3f760bbe4dc0e01ac49d405c
git revert 0fe646217a7acd6bb44a3d0b2636a34b49e87d3f

export SELINUX_IGNORE_NEVERALLOWS=true

cd ~/aex
. build/envsetup.sh
make clean
sudo rm -rf /var/www/html/*

export WITH_GAPPS=false
lunch aosp_h870-userdebug
mka aex -j$(nproc --all)
sudo cp ~/aex/out/target/product/h870/AospExtended-*-h870-*.zip /var/www/html/
rm ~/aex/out/target/product/h870/AospExtended-*-h870-*.zip

cd ~/
./upload-beta.sh
