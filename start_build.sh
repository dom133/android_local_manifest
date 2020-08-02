#!/bin/bash
set -e 

cd ~/PA
repo sync -j 16 --force-sync

cd ~/PA/frameworks/base/
git fetch https://github.com/dom133/android_frameworks_base-1 quartz && git cherry-pick fee9e9d0e97341aaaf6d468834e787129d72e748

export SELINUX_IGNORE_NEVERALLOWS=true
export TARGET_DISABLES_GAPPS=true
export TEMPORARY_DISABLE_PATH_RESTRICTIONS=true

cd ~/PA
rm -rf ~/builds/roms/pa/*

source build/envsetup.sh
make clobber

./rom-build.sh h870
mv ~/PA/out/target/product/h870/pa-quartz*-h870-*.zip ~/builds/roms/pa/

./rom-build.sh -c h870ds
mv ~/PA/out/target/product/h870ds/pa-quartz*-h870ds-*.zip ~/builds/roms/pa/

./rom-build.sh -c h872
mv ~/PA/out/target/product/h872/pa-quartz*-h872-*.zip ~/builds/roms/pa/

./rom-build.sh -c us997
mv ~/PA/out/target/product/us997/pa-quartz*-us997-*.zip ~/builds/roms/pa/

cd ~/
./upload_pa_build.sh
