cd ~/aex
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
cd ~/aex/hardware/qcom/audio-caf/msm8996
git fetch https://github.com/LineageOS/android_hardware_qcom_audio refs/changes/38/239638/1 && git cherry-pick FETCH_HEAD
cd ~/aex
. build/envsetup.sh
make clean
lunch aosp_h870-userdebug
mka aex -j$(nproc --all)
