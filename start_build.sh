cd ~/aex
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
. build/envsetup.sh
make clean
lunch aosp_h870-userdebug
mka aex -j$(nproc --all)
lunch aosp_h872-userdebug
mka aex -j$(nproc --all)
lunch aosp_us997-userdebug
mka aex -j$(nproc --all)
