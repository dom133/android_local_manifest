_AOSPA PIE for LG G6(H870)_
---------------------------

the local manifests:

	repo init -u https://github.com/AOSPA/manifest -b pie
	git clone https://github.com/dom133/android_local_manifest -b aospa-pie-G6-caf .repo/local_manifests

Then sync up with this command:

	repo sync -c -j$(nproc --all) --force-sync 
	
You can make the 4 higher depending on how fast your internet connection is. 

Finally to build:
-----------------

```bash
  ./rom-build.sh pa_h870
```
