# Build Steps (nmake)

protobuf version is 3.5.1

### build protobuf-lite library

1. open `Native Tools Command Prompt` command, eg. x64 Native Tools Command Prompt for VS 2017.

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

protobuf source has been modified, because protobuf 3.x offical source cann't build whih UE4, more details: https://github.com/jashking/UE4Protobuf


### generate protoc files

1.
    cd test

2.

    execute protoc_gen.bat

then `test.pb.h` and `test.pb.cc` would output in directory `test/`

### build protoc C++ files

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

### Configure UE Build.cs

1. copy ue4/MyProj.Build.cs into your UE4 project: `MyProj/Source/MyProj/`

2. copy `libtest.lib` and `libprotobuf-lite.lib` into your UE4 project: `MyProj/ThirdParty/Protobuf/Library/`

3. copy google protobuf headers into your UE4 project: `MyProj/ThirdParty/Protobuf/Include/`

4. copy `test.pb.h` into your UE4 project: `MyProj/ThirdParty/Protobuf/Include/`

then your can build your UE4 project with protoc C++ files.

