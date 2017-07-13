
ORIGIN_PATH=$PWD
CONFIG_PATH="$ORIGIN_PATH/costy.plist"

# 2. Read config
NEW_VERSION=$(/usr/libexec/PlistBuddy -c "print NEW_VERSION" ${CONFIG_PATH})
NEW_BUILD=$(/usr/libexec/PlistBuddy -c "print NEW_BUILD" ${CONFIG_PATH})

LOG_NAME="${ORIGIN_PATH}/log/log_${NEW_VERSION}_build${NEW_BUILD}.txt"
tail -n 20 $LOG_NAME


