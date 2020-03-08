#!/bin/bash
cd ~/DU
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

cd ~/DU/build/soong/
git fetch "https://github.com/LineageOS/android_build_soong" refs/changes/86/259286/4 && git cherry-pick FETCH_HEAD
git fetch "https://github.com/LineageOS/android_build_soong" refs/changes/87/259287/4 && git cherry-pick FETCH_HEAD
git fetch "https://github.com/LineageOS/android_build_soong" refs/changes/93/260293/1 && git cherry-pick FETCH_HEAD
git fetch "https://github.com/LineageOS/android_build_soong" refs/changes/88/259288/4 && git cherry-pick FETCH_HEAD
git fetch "https://github.com/LineageOS/android_build_soong" refs/changes/89/259289/4 && git cherry-pick FETCH_HEAD
git fetch "https://github.com/LineageOS/android_build_soong" refs/changes/90/259290/4 && git cherry-pick FETCH_HEAD
git fetch "https://github.com/LineageOS/android_build_soong" refs/changes/91/259291/4 && git cherry-pick FETCH_HEAD
git fetch "https://github.com/LineageOS/android_build_soong" refs/changes/92/259292/4 && git cherry-pick FETCH_HEAD
git fetch "https://github.com/LineageOS/android_build_soong" refs/changes/93/259293/4 && git cherry-pick FETCH_HEAD
git fetch "https://github.com/LineageOS/android_build_soong" refs/changes/11/259511/3 && git cherry-pick FETCH_HEAD
git fetch "https://github.com/LineageOS/android_build_soong" refs/changes/12/259512/3 && git cherry-pick FETCH_HEAD
git fetch "https://github.com/LineageOS/android_build_soong" refs/changes/13/259513/3 && git cherry-pick FETCH_HEAD
git fetch "https://github.com/LineageOS/android_build_soong" refs/changes/14/259514/3 && git cherry-pick FETCH_HEAD
git fetch "https://github.com/LineageOS/android_build_soong" refs/changes/15/259515/3 && git cherry-pick FETCH_HEAD
git fetch "https://github.com/LineageOS/android_build_soong" refs/changes/16/259516/3 && git cherry-pick FETCH_HEAD
git fetch "https://github.com/LineageOS/android_build_soong" refs/changes/21/259521/2 && git cherry-pick FETCH_HEAD

export SELINUX_IGNORE_NEVERALLOWS=true

cd ~/DU
source build/envsetup.sh
make clobber
lunch du_h870-userdebug
mka bacon

#sudo cp ~/aex/out/target/product/h870/AospExtended-*-h870-*.zip ~/builds/
