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

./uploadIpa_ty_fir.sh > log_fir.txt
./uploadIpa_ty_itc.sh > log_itc.txt &

