
## Fir
# Must install fir tool first: sudo gem install fir-cli
rm -rf ./archive_ty_upload_fir
mkdir ./archive_ty_upload_fir
cp ../build/xcode6.0/cos/iosArchiveTY/cos_tiyan_adHoc.ipa ./archive_ty_upload_fir/cos_tiyan_adHoc.ipa
fir login dd636ce2781617324e4ff4826346ebe7
fir me
fir publish -Q ./archive_ty_upload_fir/cos_tiyan_adHoc.ipa --verboses
