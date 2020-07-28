#!/bin/bash
set -e

cd ~/AEX
repo sync -j 16 --force-sync

cd ~/AEX/frameworks/base/
git fetch https://github.com/dom133/android_frameworks_base-1 quartz && git cherry-pick fee9e9d0e97341aaaf6d468834e787129d72e748

cd ~/AEX/kernel/lge/msm8996
git revert 856649b97537f0a24dc7d1e27e08baeafd6784c1 --no-edit
git revert cc655c81264d495f074c3a8d5addd1978fd0e78d --no-edit
git revert f223176ff5508bef2b291a6cf8f64119f47a807e --no-edit

export SELINUX_IGNORE_NEVERALLOWS=true
export TEMPORARY_DISABLE_PATH_RESTRICTIONS=true

cd ~/AEX
. build/envsetup.sh
make clobber
rm -rf ~/builds/roms/aex/*

export WITH_GAPPS=false
cd ~/AEX/
lunch aosp_h870-userdebug
make depmod
mka aex -j$(nproc --all) | tee log.txt
cp ~/AEX/out/target/product/h870/AospExtended*-h870-*.zip ~/builds/roms/aex/

export WITH_GAPPS=false
cd ~/AEX/
lunch aosp_h870ds-userdebug
make depmod
mka aex -j$(nproc --all) | tee log.txt
cp ~/AEX/out/target/product/h870ds/AospExtended*-h870ds-*.zip ~/builds/roms/aex/

export WITH_GAPPS=false
cd ~/AEX/
lunch aosp_h872-userdebug
mka aex -j$(nproc --all) | tee log.txt
cp ~/AEX/out/target/product/h872/AospExtended*-h872-*.zip ~/builds/roms/aex/

export WITH_GAPPS=false
cd ~/AEX/
lunch aosp_us997-userdebug
mka aex -j$(nproc --all) | tee log.txt
cp ~/AEX/out/target/product/us997/AospExtended*-us997-*.zip ~/builds/roms/aex/

cd ~/
./upload_aex_build.sh
