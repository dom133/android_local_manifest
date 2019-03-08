cd ~/aex
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
cd ~/aex/hardware/qcom/audio-caf/msm8996
git fetch https://github.com/LineageOS/android_hardware_qcom_audio refs/changes/38/239638/1 && git cherry-pick FETCH_HEAD
cd ~/aex/frameworks/base/
git fetch https://github.com/LG-G6-DEV/frameworks_base poundcake-release && git cherry-pick 1d00a1ab3bc2c2f4e42f20e0877c4df38dec79d0
cd ~/aex
. build/envsetup.sh
make clean
lunch aosp_h870-userdebug
mka aex -j$(nproc --all)
