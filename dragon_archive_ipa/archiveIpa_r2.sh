cd ..
python FetchDepend.py
cd ios_res
if [[ $1 == "skipversionconfig" ]];then
	echo 'skip version config'
else
	python ChangeVersions.py cosr2
fi
./buildLibcosRelease.sh
./DistrbuteIOS_R2.sh