#!/bin/bash
cd ~/los
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
cd ~/los/frameworks/base/
git fetch https://github.com/LG-G6-DEV/frameworks_base poundcake-release && git cherry-pick 1d00a1ab3bc2c2f4e42f20e0877c4df38dec79d0

export SELINUX_IGNORE_NEVERALLOWS=true

cd ~/los
. build/envsetup.sh
make clean
sudo rm -rf /var/www/html/*

lunch lineage_h870-userdebug
brunch lineage_h870-userdebug
sudo cp ~/aex/out/target/product/h870/AospExtended-*-h870-*.zip /var/www/html/
rm ~/aex/out/target/product/h870/AospExtended-*-h870-*.zip

cd ~/
./upload-beta.sh
