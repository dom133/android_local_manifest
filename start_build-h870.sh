cd ~/aex
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
cd ~/aex/frameworks/base/
git fetch https://github.com/LG-G6-DEV/frameworks_base poundcake-release && git cherry-pick 1d00a1ab3bc2c2f4e42f20e0877c4df38dec79d0
cd ~/aex
. build/envsetup.sh
make clean
lunch aosp_h870-userdebug
mka aex -j$(nproc --all)
sudo rm -rf /var/www/html/*
sudo cp ~/aex/out/target/product/h870/AospExtended-*-h870-*.zip /var/www/html/
cd /var/www/html/
sudo megamkdir -u  -p /Root/G6_AEX/$(date +'%d.%m.%Y')-BETA
sudo megaput --path /Root/G6_AEX/$(date +'%d.%m.%Y')-BETA -u  -p  *
sudo poweroff
