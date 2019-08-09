workflow "autobuild" {
  resolves = ["CI"]
  on = "release"
}

action "CI" {
  uses = "actions/docker/cli@86ab5e854a74b50b7ed798a94d9b8ce175d8ba19"
  runs = "sudo mic create fs --arch=$PORT_ARCH  --tokenmap=ARCH:$PORT_ARCH,RELEASE:$RELEASE,EXTRA_NAME:$EXTRA_NAME  --record-pkgs=name,url  --outdir=sfe-$DEVICE-$RELEASE$EXTRA_NAME  --pack-to=sfe-$DEVICE-$RELEASE$EXTRA_NAME.tar.bz2  Jolla-@RELEASE@-$DEVICE-@ARCH@.ks"
  env = {
    PLATFORM_SDK_ROOT = "/srv/mer"
    ANDROID_ROOT = "/parentroot/srv/hadk"
    VENDOR = "xiaomi"
    DEVICE = "vince"
    PORT_ARCH = "armv7hl"
    EXTRA_NAME = "-devel-`date +%Y%m%d`"
    RELEASE = "3.1.0.12"
  }
}
