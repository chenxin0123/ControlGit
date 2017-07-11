import os
import sys
import VersionsConfig as cfg
import time

def moveToPath(src,dest):
    if os.path.exists(dir):
        os.rename(src,dest)
    return

#cos
def copyCos(arg):
    path = "/Volumes/G-Drive/ARCHIVES/" + arg + "/" + cfg.cos_xcipa_ver \
           + "(build" + cfg.cos_xcbuild + ")"
    os.makedirs(path)
    moveToPath("../build/xcode6.0/cos/iosArchive/cos_adHoc.ipa", os.path.join(path, "cos_adHoc.ipa"))
    moveToPath("../build/xcode6.0/cos/iosArchive/cos_appStore.ipa", os.path.join(path, "cos_appStore.ipa"))
    moveToPath("../build/xcode6.0/cos/iosArchive/cos.xcarchive", os.path.join(path, "cos.xcarchive"))
    shutil.copytree("./res", os.path.join(path,"res_"+cfg.cos_res_ver))
    print("copyCos success")
    return


#cosnw
def copyCosnw(arg):
    path = "/Volumes/G-Drive/ARCHIVES/" + arg + "/" + cfg.cosnw_xcipa_ver \
        + "(build" + cfg.cosnw_xcbuild + ")"
    os.makedirs(path)
    moveToPath("../build/xcode6.0/cos/iosArchiveNW/cos_neiwang_adHoc.ipa", os.path.join(path, "cos_neiwang_adHoc.ipa"))
    moveToPath("../build/xcode6.0/cos/iosArchiveNW/cos_neiwang.xcarchive", os.path.join(path, "cos_neiwang.xcarchive"))
    shutil.copytree("./res", os.path.join(path,"res_"+cfg.cosnw_res_ver))
    print("copyCosnw success")
    return

#costy
def coopyCosty(arg):
    path = "/Volumes/G-Drive/ARCHIVES/" + arg + "/" + cfg.costy_xcipa_ver \
        + "(build" + cfg.costy_xcbuild + ")"
    os.makedirs(path)
    moveToPath("../build/xcode6.0/cos/iosArchiveTY/cos_tiyan_adHoc.ipa",os.path.join(path, "cos_tiyan_adHoc.ipa"))
    moveToPath("../build/xcode6.0/cos/iosArchiveTY/cos_tiyan_appStore.ipa", os.path.join(path, "cos_tiyan_appStore.ipa"))
    moveToPath("../build/xcode6.0/cos/iosArchiveTY/cos_tiyan.xcarchive", os.path.join(path, "cos_tiyan.xcarchive"))
    shutil.copytree("./res", os.path.join(path,"res_"+cfg.costy_res_ver))
    print("coopyCosty success")
    return

def doCopy(arg):
    if arg == "cos":
        copyCos(arg)
    elif arg == "cosnw":
        copyCosnw(arg)
    elif arg == "costy":
        coopyCosty(arg)
    return

agrc = len(sys.argv)
arg = ""
if agrc >= 2:
    arg = sys.argv[1]
doCopy(arg)


