#!/bin/bash
cd ~/PA
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
cd ~/PA/frameworks/base/
git fetch https://github.com/LG-G6-DEV/havoc_frameworks_base ten && git cherry-pick 794cb90533137816436ccd26ff2e04947fb12e31
cd ~/PA/packages/services/Telephony/
git fetch "https://gerrit.aospa.co/AOSPA/android_packages_services_Telephony" refs/changes/53/9453/1 && git cherry-pick FETCH_HEAD
export SELINUX_IGNORE_NEVERALLOWS=true

cd ~/PA
./rom-build.sh -c -v alpha h870

#sudo cp ~/aex/out/target/product/h870/AospExtended-*-h870-*.zip ~/builds/
