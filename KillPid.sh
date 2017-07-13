
ORIGIN_PATH=$PWD
CONFIG_PATH="$ORIGIN_PATH/killpid.plist"

# 1. Read config
pid1=$(/usr/libexec/PlistBuddy -c "print pid1" ${CONFIG_PATH})
pid2=$(/usr/libexec/PlistBuddy -c "print pid2" ${CONFIG_PATH})
pid3=$(/usr/libexec/PlistBuddy -c "print pid3" ${CONFIG_PATH})
pid4=$(/usr/libexec/PlistBuddy -c "print pid4" ${CONFIG_PATH})

# 2. Kill

if [ $pid1 -gt 0 ];then
kill $pid1
/usr/libexec/PlistBuddy -c "Set:pid1 $pid1" ${CONFIG_PATH}
fi

if [ $pid2 -gt 0 ];then
kill $pid2
/usr/libexec/PlistBuddy -c "Set:pid2 $pid2" ${CONFIG_PATH}
fi

if [ $pid3 -gt 0 ];then
kill $pid3
/usr/libexec/PlistBuddy -c "Set:pid3 $pid3" ${CONFIG_PATH}
fi

if [ $pid4 -gt 0 ];then
kill $pid4
/usr/libexec/PlistBuddy -c "Set:pid4 $pid4" ${CONFIG_PATH}
fi
