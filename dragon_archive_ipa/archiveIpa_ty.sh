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

./uploadIpa_ty_fir.sh &
./uploadIpa_ty_itc.sh
#osascript -e 'tell application "Terminal" to activate' -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down' -e 'tell application "Terminal" to do script "sh uploadIpa_ty_fir.sh" in selected tab of the front window'
#osascript -e 'tell application "Terminal" to activate' -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down' -e 'tell application "Terminal" to do script "sh uploadIpa_ty_itc.sh" in selected tab of the front window'
wait
python SendEmail.py "Finish upload costy $NEW_VERSION(build$NEW_BUILD) to appStore and fir" ./archive_ty_upload_fir/fir-cos_tiyan.png
