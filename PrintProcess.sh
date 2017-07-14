ORIGIN_PATH=$PWD
CONFIG_PATH="$ORIGIN_PATH/killpid.plist"

# 1. Read config
logpid=$(/usr/libexec/PlistBuddy -c "print logpid" ${CONFIG_PATH})

# 2. Kill

if [ $logpid -gt 0 ];then
kill $pid1
/usr/libexec/PlistBuddy -c "Set:pid1 0" ${CONFIG_PATH}
fi
ps aux | grep -E "Archive|archive|uploadIpa|watch|Watch" > log/pid.txt
cat log/pid.txt
