cd ..
python FetchDepend.py
cd ios_res
if [[ $1 == "skipversionconfig" ]];then
	echo 'skip version config'
else
	python ChangeVersions.py cos
fi
./buildLibcosRelease.sh
./DistrbuteIOSAppstore.sh