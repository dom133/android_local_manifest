_LineageOS 16.0 for LG G6(H870)_
---------------------------

the local manifests:

	repo init -u git://github.com/LineageOS/android.git -b lineage-16.0
	git clone https://github.com/dom133/android_local_manifest -b lineage-16.0-G6-dev .repo/local_manifests

Then sync up with this command:

	repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
	
You can make the 4 higher depending on how fast your internet connection is. 

Finally to build:
-----------------

```bash
  . build/envsetup.sh
  lunch lineage_h870-userdebug
  brunch lineage_h870-userdebug
```
