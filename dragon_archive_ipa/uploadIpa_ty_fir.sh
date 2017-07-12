
## Fir
# Must install fir tool first: sudo gem install fir-cli
rm -rf ./archive_ty_upload_fir
mkdir ./archive_ty_upload_fir
cp ../build/xcode6.0/cos/iosArchiveTY/cos_tiyan_adHoc.ipa ./archive_ty_upload_fir/cos_tiyan_adHoc.ipa
fir login dd636ce2781617324e4ff4826346ebe7
fir me
<<<<<<< HEAD
<<<<<<< HEAD
fir publish -Q ./archive_ty_upload_fir/cos_tiyan_adHoc.ipa --verboses
=======
=======
>>>>>>> fccd9e07150cb5d1680f229b4b0380c455b583e9
fir publish -Q ./archive_ty_upload_fir/cos_tiyan_adHoc.ipa --verboses

# Send Email
#python SendEmail.py "Finish upload costy $NEW_VERSION(build$NEW_BUILD) to fir" ./archive_ty_upload_fir/fir-cos_tiyan.png
<<<<<<< HEAD
>>>>>>> 40082a9... 1.0.21(build14) mark
=======
>>>>>>> fccd9e07150cb5d1680f229b4b0380c455b583e9
