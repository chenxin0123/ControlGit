import fileinput
import os
import shutil
import platform
import sys

def mkdir_replace(dir):
    if os.path.exists(dir):
        shutil.rmtree(dir)
    os.mkdir(dir)
    return

def safe_rename(fromname, toname):
    try:
        os.rename(fromname, toname)
    except Exception as e:
        print "'Err'+str(e)+str(__line__) ",str(e),fromname,toname
    return
    
def safe_rmtree(dir):
    try:
        shutil.rmtree(dir)
    except Exception as e:
        print "'Err'+str(e)+str(__line__)",str(e),dir
    return

def safe_copytree(fromdir, todir):
    try:
        shutil.copytree(fromdir, todir)
    except Exception as e:
        print "'Err'+str(e)+str(__line__)",str(e),fromdir,todir
    return
    
def safe_copy(fromname, toname):
    try:
        shutil.copy(fromname, toname)
    except Exception as e:
        print "'Err'+str(e)+str(__line__)",str(e),fromname,toname
    return

    
tmp_dir_name = "res_tmp"
tmp_dir = "./"+tmp_dir_name
src_dir_name = "res"
src_dir = "./"+src_dir_name
outDir="./ios_res/res"

if os.path.exists(tmp_dir):
    safe_rmtree(tmp_dir)

safe_rename(src_dir,tmp_dir)
mkdir_replace(src_dir)
safe_copy(os.path.join(tmp_dir,"config_nw.ini"), os.path.join(src_dir,"config_nw.ini"))
safe_copy(os.path.join(tmp_dir,"config_ty.ini"), os.path.join(src_dir,"config_ty.ini"))
safe_copy(os.path.join(tmp_dir,"config.ini"), os.path.join(src_dir,"config.ini"))
safe_rmtree(tmp_dir)
os.chdir("../")

os.system("python ./FetchResIOS.py")

#PublishIOS
safe_copytree("./debug/data",os.path.join(outDir,"data"))
safe_rmtree("./ios_res/res/data/ui/imageset")
safe_rmtree("./ios_res/res/data/ui/imageset_android")
safe_rmtree("./ios_res/res/data/ui/imageset_c")
safe_rmtree("./ios_res/res/data/ui/imageset_c_android")
safe_rename("./ios_res/res/data/ui/imageset_ios", "./ios_res/res/data/ui/imageset")
safe_rename("./ios_res/res/data/ui/imageset_c_ios", "./ios_res/res/data/ui/imageset_c")

safe_copy("./dep/server/foo.db", os.path.join(outDir,"foo.db"))
safe_copytree("./dep/server/tmpini", os.path.join(outDir,"tmpini"))
safe_copytree("./debug/presentations", os.path.join(outDir,"presentations"))
safe_copy("./debug/res/shareicon.png", os.path.join(outDir,"shareicon.png"))
safe_copytree("./dep/engine_ref/shader", os.path.join(outDir,"shader"))

#packIOSRes
os.chdir("./ios_res")
if platform.system() == 'Darwin':
    os.system("find ./ -name "".DS_Store"" -delete")
mkdir_replace("./res/new_data")
mkdir_replace("./res/new_data/ui")
safe_rename("./res/data/ui/font", "./res/new_data/ui/font")
safe_rename("./res/data/ui/imageset", "./res/new_data/ui/imageset")
safe_rename("./res/data/ui/imageset_c", "./res/new_data/ui/imageset_c")
safe_rename("./res/data/ui/video", "./res/new_data/ui/video")

mkdir_replace("./res/tmpdata")
safe_rename("./res/data","./res/tmpdata/data")
safe_rename("./res/presentations","./res/tmpdata/presentations")
safe_rename("./res/shader","./res/tmpdata/shader")

if platform.system() == 'Darwin':
    os.system("find ./ -name "".DS_Store"" -delete")

if platform.system() == 'Windows':
    os.system("..\\build\\android\\Release\\7-Zip\\7z.exe a -t7z .\\res\\data.7z -ms=off -mhe -mf=off -pcosmobile_gogogo -r .\\res\\tmpdata\\*")
else:
    os.system("./7za a -t7z ./res/data.7z -ms=off -mhe -mf=off -pcosmobile_gogogo -r ./res/tmpdata/*")

safe_rmtree("./res/tmpdata")
safe_rename("./res/new_data", "./res/data")
#CreateFileList
os.chdir("../")

if platform.system() == 'Windows':
    rootdir = os.getcwd() + "./ios_res/res"
    if os.path.exists(rootdir):
        filepath = rootdir + "./files.txt"
        f = open(filepath, 'w')
        sys.stdout = f
        for (dirpath, dirnames, filenames) in os.walk(rootdir):
            for filename in filenames:
                fullName = os.path.join(dirpath, filename)
                fullName = fullName[len(rootdir) + 1:]
                fullName = fullName.replace('\\', '/')
                print(fullName)
        f.close()
else:
    os.system("python ./CreateFileList.py")


#back to ios_res
os.chdir("./ios_res")
if os.path.exists("./packres"):
    safe_rmtree("./packres")
mkdir_replace("./packres")
safe_copytree("./res", "./packres/res")
if os.path.exists("./cosgame_resource.png"):
    os.remove("./cosgame_resource.png")

if platform.system() == 'Windows':
    os.system("..\\build\\android\\Release\\IFSPackage\\Packager.exe new -zip=zlib -skip=.svn -diroff .\\cosgame_resource.ifs .\\packres")
else:
    os.system("./nifs create ./packres ./cosgame_resource.ifs")
safe_rename("./cosgame_resource.ifs","./cosgame_resource.png")
safe_rmtree("./packres")