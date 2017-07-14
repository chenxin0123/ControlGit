#./CWatchArchive.sh &
#./CWatchKill.sh &
#./CWatchPrintProcess.sh &
#./CWatchPull.sh &
#./CWatchPush.sh &


osascript -e 'tell application "Terminal" to activate' -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down' -e 'tell application "Terminal" to do script "sh CWatchArchive.sh" in selected tab of the front window'
osascript -e 'tell application "Terminal" to activate' -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down' -e 'tell application "Terminal" to do script "sh CWatchKill.sh" in selected tab of the front window'
osascript -e 'tell application "Terminal" to activate' -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down' -e 'tell application "Terminal" to do script "sh CWatchPrintProcess.sh" in selected tab of the front window'
osascript -e 'tell application "Terminal" to activate' -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down' -e 'tell application "Terminal" to do script "sh CWatchPull.sh" in selected tab of the front window'
osascript -e 'tell application "Terminal" to activate' -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down' -e 'tell application "Terminal" to do script "sh CWatchPush.sh" in selected tab of the front window'
osascript -e 'tell application "Terminal" to activate' -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down' -e 'tell application "Terminal" to do script "sh CWatchSendITC.sh" in selected tab of the front window'
osascript -e 'tell application "Terminal" to activate' -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down' -e 'tell application "Terminal" to do script "sh CWatchSendFIR.sh" in selected tab of the front window'
