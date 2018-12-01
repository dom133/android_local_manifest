_ClearAOS PIE for LG G6(H870)_
---------------------------

the local manifests:

	$ repo init -u git@gitlab.com:clearaos/android_manifest.git -b android-9
	$ git clone https://github.com/dom133/android_local_manifest -b caos-9-G6 .repo/local_manifests

Then sync up with this command:

	$ repo sync --force-sync
	
You can make the 4 higher depending on how fast your internet connection is. 
