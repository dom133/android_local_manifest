#!/bin/bash
cd ~/DU
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

export SELINUX_IGNORE_NEVERALLOWS=true

source build/envsetup.sh
make clobber
lunch du_h870-userdebug
mka bacon

#sudo cp ~/aex/out/target/product/h870/AospExtended-*-h870-*.zip ~/builds/
