#!/bin/bash
cd ~/PA
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
cd ~/PA/frameworks/base/
git fetch https://github.com/LG-G6-DEV/havoc_frameworks_base ten && git cherry-pick 794cb90533137816436ccd26ff2e04947fb12e31

export SELINUX_IGNORE_NEVERALLOWS=true

cd ~/PA
sudo rm -rf ~/builds/*

source build/envsetup.sh
repopick 9742 9743 8709

./rom-build.sh -c -v alpha h870

sudo cp ~/PA/out/target/product/h870/pa-quartz-alpha-*-h870-*.zip ~/builds/
