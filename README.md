# Android Tools
Collection of useful Android Tools.

## run_pm_installer.sh
Sometimes you need to install a developed application and see how the
installation process of Package Installer goes. Simple adb install command does 
not provide such possibility. This script copies application to the attached 
device and starts Android's Package Installer to install this package.

Usage:
```
source run_pm_installer.sh <apk_to_install>
```

If you do not have path to "adb" command within your PATH variable, specify the
full path in "ADB_COMMAND_PATH" constant of the script.

