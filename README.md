# Build protoc files with cmake for Unreal Engine 4.

Env:

+ protobuf version is 3.5.1
+ Native build command is nmake
+ cmake version is 3.10
+ Unreal Engine 4 version is 4.18

## Windows

#### 1. build protobuf-lite library

1. open `Native Tools Command Prompt` command, eg. `x64 Native Tools Command Prompt for VS 2017`.

2.

    cd cmake
3.

    mkdir build & cd build
4.

    mkdir release & cd release
5.

    cmake -G "NMake Makefiles" -DCMAKE_BUILD_TYPE=Release ../..
6.

    nmake

then `libprotobuf-lite.lib` would output to directory `install/Release/`.

protobuf source has been modified, because protobuf 3.x offical source cann't build with UE4.
source modify details: https://github.com/jashking/UE4Protobuf


#### 2. generate protoc files

1.

    cd test

2. execute `protoc_gen.bat`

then `test.pb.h` and `test.pb.cc` would output in directory `test/`

#### 3. build protoc C++ files

1.

    cd test/cmake
    
2.

    mkdir build & cd build
3.

    mkdir release & cd release
4.

    cmake -G "NMake Makefiles" -DCMAKE_BUILD_TYPE=Release ../..
    
5.

    nmake

then `libtest.lib` would output to directory `test/install/Release/`

#### 4. Configure UE4 Build.cs

1. copy `ue4/MyProj.Build.cs` into your UE4 project: `MyProj/Source/MyProj/`

2. copy `libtest.lib` and `libprotobuf-lite.lib` into your UE4 project: `MyProj/ThirdParty/Protobuf/Library/`

3. copy google protobuf headers into your UE4 project: `MyProj/ThirdParty/Protobuf/Include/`

4. copy `test.pb.h` into your UE4 project: `MyProj/ThirdParty/Protobuf/Include/`

5. Add `bEnableExceptions = true;` inside the {ProjectName}.Build.cs constructor. 

then your can build your UE4 project with protoc C++ files.

## Android NDK

1. execute `\ndk_build\build.bat`

2. execute `test\ndk_build\build.bat`

3. copy `ndk_build\obj\local\armeabi-v7a\libprotobuf-lite-ndk.a` and `test\ndk_build\obj\local\armeabi-v7a\libtest-ndk.a` into your UE4 project: `MyProj/ThirdParty/Protobuf/Library/`

4. copy headers in `test\src\` into your UE4 project: `MyProj/ThirdParty/Protobuf/Include/` 

5. build your UE4 project.
