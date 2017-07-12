
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

# 4. Write control git
/usr/libexec/PlistBuddy -c "Set:OLD_VERSION $NEW_VERSION" ${CONFIG_PATH}
/usr/libexec/PlistBuddy -c "Set:OLD_BUILD $NEW_BUILD" ${CONFIG_PATH}

# 5. Push control git
echo 'PUSH GIT'
git add .
git commit -m "$NEW_VERSION(build$NEW_BUILD) mark"
git push -f

# 6. Checkout target git
echo 'CHECKOUT TARGET GIT'
cd $TARGET_PATH
git reset --hard
git fetch origin
git co neiwang_newtiyan
git reset --hard origin/neiwang_newtiyan

# 7. Fill config to target git
cd $ORIGIN_PATH
echo 'config ini'
python ChangeVersions.py $NEW_VERSION.0 $NEW_VERSION.1 $TARGET_PATH/ios_res/res/config_ty.ini
echo 'config plist'
/usr/libexec/PlistBuddy -c "Set:CFBundleShortVersionString $NEW_VERSION" "$TARGET_PATH/build/xcode6.0/cos/cos ty-Info.plist"
/usr/libexec/PlistBuddy -c "Set:CFBundleVersion $NEW_BUILD" "$TARGET_PATH/build/xcode6.0/cos/cos ty-Info.plist"
/usr/libexec/PlistBuddy -c "Set:CFBundleShortVersionString $NEW_VERSION" "$TARGET_PATH/build/xcode6.0/cos/cosext/InfoTY.plist"
/usr/libexec/PlistBuddy -c "Set:CFBundleVersion $NEW_BUILD" "$TARGET_PATH/build/xcode6.0/cos/cosext/InfoTY.plist"

# 8. Archive & Publish
echo 'ARCHIVE'
cd $TARGET_PATH/ios_res
sh archiveIpa_ty.sh skipversionconfig

cd $ORIGIN_PATH
git commit --amend -m "$NEW_VERSION(build$NEW_BUILD) done"
git push -f