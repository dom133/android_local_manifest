# m216_manifest
Local manifest file for building LineageOS 14.1 for LG K420 DS/N

Steps to build LineageOS for K10 4G LTE:

### Initialize the LineageOS source repository

Enter the following to initialize the repository:
```
cd ~/android/system/
repo init -u git://github.com/LineageOS/android.git -b cm-14.1
```
### Get the required local manifest

```
mkdir -p ~/android/system/.repo/local_manifests
curl https://raw.githubusercontent.com/LG-K10/android_local_manifest/cm-14.1/local_manifest.xml > .repo/local_manifests/local_manifest.xml
```

### Let's start downloading the source code!

```
repo sync
```
