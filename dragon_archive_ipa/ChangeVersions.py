import VersionsConfig as cfg
import os
import sys

def setKeyValue(key,value,plist_path):
	command = "/usr/libexec/PlistBuddy -c " + "\"Set:" + key + " " + value  +"\" " + plist_path
	os.system(command)
	return

def modifyIni(ipaver,resver,inipath):
    f = open(inipath, 'r')
    result = list()
    ori = list()
    for line in open(inipath, 'r'):
        line = f.readline()
        ori.append(line)
        v = line.split('=')
        if len(v) == 2 :
            key = v[0]
            ipaidx = key.find("apkver")
            residx = key.find("resver")
            if ipaidx == 0 :
                v[1] = ipaver
                line = v[0] + "=" + v[1] + "\r\n"
            if residx == 0 :
                v[1] = resver
                line = v[0] + "=" + v[1]
        result.append(line)

    f.close()
    fileContent = ''
    for line in result:
        fileContent += line

    f = open(inipath, 'w')
    f.write(fileContent)
    f.close()
    return

#cos
def configCos():
    setKeyValue("CFBundleShortVersionString", cfg.cos_xcipa_ver, "../build/xcode6.0/cos/cos-Info.plist")
    setKeyValue("CFBundleVersion", cfg.cos_xcbuild, "../build/xcode6.0/cos/cos-Info.plist")
    setKeyValue("CFBundleShortVersionString", cfg.cos_ext_xcipa_ver, "../build/xcode6.0/cos/cosext/Info.plist")
    setKeyValue("CFBundleVersion", cfg.cos_ext_xcbuild, "../build/xcode6.0/cos/cosext/Info.plist")
    modifyIni(cfg.cos_ipa_ver, cfg.cos_res_ver, "./res/config.ini")
    print("configCos success")
    return


#cosnw
def configCosnw():
    setKeyValue("CFBundleShortVersionString", cfg.cosnw_xcipa_ver, "\"../build/xcode6.0/cos/cos nw-Info.plist\"")
    setKeyValue("CFBundleVersion", cfg.cosnw_xcbuild, "\"../build/xcode6.0/cos/cos nw-Info.plist\"")
    setKeyValue("CFBundleShortVersionString", cfg.cosnw_ext_xcipa_ver, "../build/xcode6.0/cos/cosext/InfoNW.plist")
    setKeyValue("CFBundleVersion", cfg.cosnw_ext_xcbuild, "../build/xcode6.0/cos/cosext/InfoNW.plist")
    modifyIni(cfg.cosnw_ipa_ver, cfg.cosnw_res_ver, "./res/config_nw.ini")
    print("configCosnw success")
    return

#costy
def configCosty():
    setKeyValue("CFBundleShortVersionString", cfg.costy_xcipa_ver, "\"../build/xcode6.0/cos/cos ty-Info.plist\"")
    setKeyValue("CFBundleVersion", cfg.costy_xcbuild, "\"../build/xcode6.0/cos/cos ty-Info.plist\"")
    setKeyValue("CFBundleShortVersionString", cfg.costy_ext_xcipa_ver, "../build/xcode6.0/cos/cosext/InfoTY.plist")
    setKeyValue("CFBundleVersion", cfg.costy_ext_xcbuild, "../build/xcode6.0/cos/cosext/InfoTY.plist")
    modifyIni(cfg.costy_ipa_ver, cfg.costy_res_ver, "./res/config_ty.ini")
    print("configCosty success")
    return

#cosr2
def configCosr2():
    setKeyValue("CFBundleShortVersionString", cfg.cosr2_xcipa_ver, "\"../build/xcode6.0/cos/cos r2-Info.plist\"")
    setKeyValue("CFBundleVersion", cfg.cosr2_xcbuild, "\"../build/xcode6.0/cos/cos r2-Info.plist\"")
    setKeyValue("CFBundleShortVersionString", cfg.cosr2_ext_xcipa_ver, "../build/xcode6.0/cos/cosext/InfoR2.plist")
    setKeyValue("CFBundleVersion", cfg.cosr2_ext_xcbuild, "../build/xcode6.0/cos/cosext/InfoR2.plist")
    modifyIni(cfg.cosr2_ipa_ver, cfg.cosr2_res_ver, "./res/config.ini")
    print("configCosr2 success")
    return

def doConfig(arg):
    if arg == "all":
        configCos()
        configCosnw()
        configCosty()
    elif arg == "cos":
        configCos()
    elif arg == "cosnw":
        configCosnw()
    elif arg == "costy":
        configCosty()
    elif arg == "cosr2":
        configCosr2()
    return

agrc = len(sys.argv)
arg = "all"
if agrc >= 2:
    arg = sys.argv[1]
doConfig(arg)

