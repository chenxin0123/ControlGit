ORIGIN_PATH=$PWD
CONFIG_PATH="$ORIGIN_PATH/costy.plist"
TARGET_PATH="$ORIGIN_PATH/../cos_ty/ios_res"

RESEND_FIR=$(/usr/libexec/PlistBuddy -c "print RESEND_FIR" ${CONFIG_PATH})
if [ $RESEND_FIR -gt 0 ];then
/usr/libexec/PlistBuddy -c "Set:RESEND_FIR 0" ${CONFIG_PATH}
cd $TARGET_PATH
sh uploadIpa_ty_fir.sh > $ORIGIN_PATH/log/sendfir.log

NEW_VERSION=$(/usr/libexec/PlistBuddy -c "print NEW_VERSION" ${CONFIG_PATH})
NEW_BUILD=$(/usr/libexec/PlistBuddy -c "print NEW_BUILD" ${CONFIG_PATH})
python SendEmail.py "udid版本:$NEW_VERSION(build$NEW_BUILD)" $TARGET_PATH/archive_ty_upload_fir/fir-cos_tiyan.png
fi
