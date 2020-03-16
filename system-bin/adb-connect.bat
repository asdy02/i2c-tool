
adb wait-for-device
adb root
adb wait-for-device
adb disable-verity
adb reboot
adb wait-for-device
adb root
adb remount
adb push i2cdump system/bin/
adb push i2cdetect system/bin/
adb push i2cget system/bin/
adb push i2ctransfer system/bin/
adb push i2cset system/bin/
adb shell chmod 777 system/bin/i2c*

pause