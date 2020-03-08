#!/bin/bash
cd ~/DU
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
cd ~/DI/frameworks/base/
git fetch https://github.com/LG-G6-DEV/havoc_frameworks_base ten && git cherry-pick 794cb90533137816436ccd26ff2e04947fb12e31

export SELINUX_IGNORE_NEVERALLOWS=true

cd ~/DU
source build/envsetup.sh
make clobber
lunch du_h870-userdebug
mka bacon

#sudo cp ~/aex/out/target/product/h870/AospExtended-*-h870-*.zip ~/builds/
