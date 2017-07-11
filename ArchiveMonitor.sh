
ORIGIN_PATH=$PWD
CONFIG_PATH="$ORIGIN_PATH/costy.plist"
TARGET_PATH="$ORIGIN_PATH/../cos_ty"
echo "ORIGIN_PATH = $ORIGIN_PATH"
# 1. Pull control git
echo 'PULL GIT'
git pull

# 2. Read config
OLD_VERSION=$(/usr/libexec/PlistBuddy -c "print OLD_VERSION" ${CONFIG_PATH})
OLD_BUILD=$(/usr/libexec/PlistBuddy -c "print OLD_BUILD" ${CONFIG_PATH})
NEW_VERSION=$(/usr/libexec/PlistBuddy -c "print NEW_VERSION" ${CONFIG_PATH})
NEW_BUILD=$(/usr/libexec/PlistBuddy -c "print NEW_BUILD" ${CONFIG_PATH})
echo "OLD_VERSION = $OLD_VERSION OLD_BUILD = $OLD_BUILD NEW_VERSION = $NEW_VERSION NEW_BUILD = $NEW_BUILD"

# 3. Compare
echo 'COMPARE'
DO_BUILD=false
if [[ $NEW_VERSION > $OLD_VERSION ]];then
	echo 'version bigger'
	DO_BUILD=true
elif [[ $NEW_VERSION = $OLD_VERSION ]] && [ $NEW_BUILD -gt $OLD_BUILD ];then
	echo 'build bigger'
	DO_BUILD=true
fi
if [ "$DO_BUILD" = false ];then
	echo 'No need to build'
	exit
fi
osascript -e 'tell application "Terminal" to activate' -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down' -e 'tell application "Terminal" to do script "sh Archive.sh $1" in selected tab of the front window'