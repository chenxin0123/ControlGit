import sys
import os

def doConfig(ipaver,resver,inipath):
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

agrc = len(sys.argv)
if agrc >= 4:

    ipaver = sys.argv[1]
    resver = sys.argv[2]
    inipath = sys.argv[3]
    print "ipaver = " + ipaver +"; resver = " + resver
    doConfig(ipaver,resver,inipath)

