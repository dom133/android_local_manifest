_LOS Q for LG G6(H870)_
---------------------------

the local manifests:

	git clone https://github.com/dom133/android_local_manifest -b lineage-17.0-G6-caf .repo/local_manifests

Then sync up with this command:

	repo sync -c -j$(nproc --all) 
	
You can make the 4 higher depending on how fast your internet connection is. 

Finally to build:
-----------------

```bash
  . build/envsetup.sh
  lunch lineage_h870-userdebug
  brunch lineage_h870-userdebug
```
