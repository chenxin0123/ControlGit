cd ..
python FetchDepend.py
cd ios_res
if [[ $1 == "skipversionconfig" ]];then
	echo 'skip version config'
else
	python ChangeVersions.py costy
fi
./buildLibcosRelease.sh
./DistrbuteIOSTiyan.sh

sh uploadIpa_ty_fir.sh
#osascript -e 'tell application "Terminal" to activate' -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down' -e 'tell application "Terminal" to do script "sh uploadIpa_ty_fir.sh" in selected tab of the front window'
osascript -e 'tell application "Terminal" to activate' -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down' -e 'tell application "Terminal" to do script "sh uploadIpa_ty_itc.sh" in selected tab of the front window'
