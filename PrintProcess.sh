ORIGIN_PATH=$PWD
CONFIG_PATH="$ORIGIN_PATH/killpid.plist"

logpid=$(/usr/libexec/PlistBuddy -c "print logpid" ${CONFIG_PATH})
if [ $logpid -gt 0 ];then
/usr/libexec/PlistBuddy -c "Set:logpid 0" ${CONFIG_PATH}
fi
ps aux | grep -E "Archive|archive|uploadIpa|watch|Watch" > log/pid.txt
cat log/pid.txt
