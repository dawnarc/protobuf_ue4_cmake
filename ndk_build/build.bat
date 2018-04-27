
RD jni\google\ /s /q
RD obj\ /s /q

xcopy /s/y/i/f "..\src\*.cc" "jni\"
xcopy /s/y/i/f "..\src\*.h" "jni\"

ndk-build

pause