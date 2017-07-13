
ORIGIN_PATH=$PWD
CONFIG_PATH="$ORIGIN_PATH/killpid.plist"

# 1. Read config
pid1=$(/usr/libexec/PlistBuddy -c "print pid1" ${CONFIG_PATH})
pid2=$(/usr/libexec/PlistBuddy -c "print pid2" ${CONFIG_PATH})
pid3=$(/usr/libexec/PlistBuddy -c "print pid3" ${CONFIG_PATH})
pid4=$(/usr/libexec/PlistBuddy -c "print pid4" ${CONFIG_PATH})
echo "OLD_VERSION = $OLD_VERSION OLD_BUILD = $OLD_BUILD NEW_VERSION = $NEW_VERSION NEW_BUILD = $NEW_BUILD"

# 3. Kill

if 
kill $pid1

# 4. Write control git
/usr/libexec/PlistBuddy -c "Set:OLD_VERSION $NEW_VERSION" ${CONFIG_PATH}
/usr/libexec/PlistBuddy -c "Set:OLD_BUILD $NEW_BUILD" ${CONFIG_PATH}

# 5. Push control git
#echo 'PUSH GIT'
#git add .
#git commit -m "$NEW_VERSION(build$NEW_BUILD) mark"
#git push -f

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
