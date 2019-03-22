cd ~/aex
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
cd ~/aex/hardware/qcom/audio-caf/msm8996/
git fetch https://github.com/LineageOS/android_hardware_qcom_audio refs/changes/38/239638/1 && git cherry-pick FETCH_HEAD
cd ~/aex/frameworks/base/
git fetch https://github.com/LG-G6-DEV/frameworks_base poundcake-release && git cherry-pick 1d00a1ab3bc2c2f4e42f20e0877c4df38dec79d0
cd ~/aex/device/lge/msm8996-common/
git revert --no-edit f05caa05a549236fa762daa8fd6e4a60ad433868
cd ~/aex
. build/envsetup.sh
make clean
lunch aosp_h870-userdebug
mka aex -j$(nproc --all)
lunch aosp_h872-userdebug
mka aex -j$(nproc --all)
lunch aosp_us997-userdebug
mka aex -j$(nproc --all)
sudo rm -rf /var/www/html/*
sudo cp ~/aex/out/target/product/h870/AospExtended-*-h870-*.zip /var/www/html/
sudo cp ~/aex/out/target/product/h872/AospExtended-*-h872-*.zip /var/www/html/
sudo cp ~/aex/out/target/product/us997/AospExtended-*-us997-*.zip /var/www/html/
cd /var/www/html/
sudo megamkdir -u  -p /Root/G6_AEX/$(date +'%d.%m.%Y')
sudo megaput --path /Root/G6_AEX/$(date +'%d.%m.%Y') -u  -p  *
sudo poweroff
