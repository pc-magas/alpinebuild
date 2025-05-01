# Alpine Apk package generating docker image

## Volumes

Directory | Reason
--- | ---
/home/packager/.abuild | Abuild config anf *private* signing key storage
/etc/apk/keys/ | Signing Public key storage
/usr/src/apkbuild | Location where *source code* .tar.gz file and `APKBUILD` files are located
/home/packager/release | The location where built apk files are placed upon