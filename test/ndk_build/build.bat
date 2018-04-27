RD jni\protoc_files\ /s /q
RD obj\ /s /q

mkdir jni\protoc_files

xcopy /s/y/i/f "..\src\*.cc" "jni\protoc_files\"
xcopy /s/y/i/f "..\src\*.h" "jni\protoc_files\"

ndk-build

pause