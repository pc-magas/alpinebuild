# Alpine Apk package generating docker image

# Basic Usage

## Step 1: Create a directory where source code and `APKBUILD` file is located upon

```
mkdir ./source_folder
# Create APKBUILD
touch ./source_folder/APKBUILD
```

Then optionally, if building from local source code, create a tarball containing the source code.
The generated tarball should be in `./source_folder` as well.

## Step 2: Create a release folder where built apks located upon

```
mkdir ./release
```

## Step 3: Create a volue where keys and abuild confiuf is located upon

```
mkdit ./volume_dir
```

## Step 4: Run the container

```
docker run \
    -v source_folder:/usr/src/apkbuild  \
    -v ./volume_dir/.abuild:/home/packager/.abuild \
    -v ./volume_dir/keys:/etc/apk/keys \
    -v ./release:/home/packager/release \
    pcmagas/alpinebuild
```

# Manual building:

```
bash .github/build_docker.sh
```

# Volumes and its usage

Directory | Reason
--- | ---
/home/packager/.abuild | Abuild config anf *private* signing key storage
/etc/apk/keys/ | Signing Public key storage
/usr/src/apkbuild | Location where *source code* .tar.gz file and `APKBUILD` files are located
/home/packager/release | The location where built apk files are placed upon. Also the `APKBUILD` file is placed upon with the correct checksum.


# Key Generation

By default `pcmagas/alpinebuild` generates its own keys used for signing the built apk. The public singing key is stored upon `/etc/apk/keys/` whneread the private key is stored upon `/home/packager/.abuild`.
