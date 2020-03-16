@echo off
setlocal ENABLEDELAYEDEXPANSION
set /a ii=3
for /l %%i in (1,1,116) do (
echo "adb shell i2cget -y -f 2 !ii! 0xf0 w"
adb shell "i2cget -y -f 2 !ii! 0xf0 w"
set /a ii+=1
)
pause