cd ..
python FetchDepend.py
cd ios_res
python ChangeVersions.py cosnw
./buildLibcosRelease.sh
./DistrbuteIOSNeiwang.sh