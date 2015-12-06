#!/bin/sh
ADB_COMMAND_PATH="adb"
ADB_FOUND=`${ADB_COMMAND_PATH} devices | tail -2 | head -1 | cut -f 1 | sed 's/ *$//g'`
DEVICES_NOT_PRESENT="List of devices attached"
SDCARD_FOLDER="/sdcard"

PATH_TO_APK_FILE=$1
if [ -f $PATH_TO_APK_FILE ];
then
  echo "File $PATH_TO_APK_FILE exists."
  if [[ ${ADB_FOUND} != ${NOT_PRESENT} ]]; then
    FILE_NAME=$(basename $PATH_TO_APK_FILE)
    APK_FILEPATH="$SDCARD_FOLDER/$FILE_NAME"
    echo "Pushing $FILE_NAME to the device..."
    ${ADB_COMMAND_PATH} push $PATH_TO_APK_FILE $APK_FILEPATH
    echo "Starting package installer..."
    ${ADB_COMMAND_PATH} shell am start -a "android.intent.action.VIEW" -t "application/vnd.android.package-archive" -d "file://$APK_FILEPATH"
    echo "Done. Don't forget to delete file $FILE_NAME from $SDCARD_FOLDER after it is installed!"
  else
    echo "Android device seems to be missing. Exiting!"
  fi
else
  echo "File $PATH_TO_APK_FILE does not exist. Exiting!"
fi
