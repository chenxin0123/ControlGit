
# Itunes Connect
# Must install fastlane first: sudo gem install fastlane
rm -rf ./archive_ty_upload_itc
mkdir ./archive_ty_upload_itc
cp ../build/xcode6.0/cos/iosArchiveTY/cos_tiyan_appStore.ipa ./archive_ty_upload_itc/cos_tiyan_appStore.ipa
fastlane deliver --ipa "./archive_ty_upload_itc/cos_tiyan_appStore.ipa" -u "2990699839@qq.com" --skip_screenshots --skip_metadata --skip_app_version_update --verbose
rm -rf ./archive_ty_upload_itc

# Send Email
echo 'Sending email'
python SendEmail.py "Finish upload costy $NEW_VERSION(build$NEW_BUILD) to appStore" ./archive_ty_upload_fir/fir-cos_tiyan.png
echo 'Email sent'
