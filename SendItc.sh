ORIGIN_PATH=$PWD
CONFIG_PATH="$ORIGIN_PATH/costy.plist"
TARGET_PATH="$ORIGIN_PATH/../cos_ty/ios_res"

RESEND_ITC=$(/usr/libexec/PlistBuddy -c "print RESEND_ITC" ${CONFIG_PATH})
if [ $RESEND_ITC -gt 0 ];then
/usr/libexec/PlistBuddy -c "Set:RESEND_ITC 0" ${CONFIG_PATH}
cd $TARGET_PATH
sh uploadIpa_ty_itc.sh > $ORIGIN_PATH/log/senditc.log
fi
