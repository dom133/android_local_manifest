_Omni Android 10 for LG G6(H870)_
---------------------------

the local manifests:

	git clone https://github.com/dom133/android_local_manifest -b omni-a10-G6 .repo/local_manifests

Then sync up with this command:

	repo sync -c -j$(nproc --all) 
	
You can make the 4 higher depending on how fast your internet connection is. 

Finally to build:
-----------------

```bash
  . build/envsetup.sh
  lunch omni_h870-userdebug
  brunch omni_h870-userdebug
```
