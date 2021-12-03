# Build protoc files for Unreal Engine 4 using cmake.

Env:

+ protobuf version is 3.12.2
+ Native build command is nmake
+ cmake version is 3.10
+ Unreal Engine 4 version is 4.18



### Windows

##### 1. build protobuf-lite library ( or run build-windows.bat)

1. open `Native Tools Command Prompt` command, e.g. `x64 Native Tools Command Prompt for VS 2017`.

2. Address to directory `build_protobuf-lite/` (address to directory `build_protobuf/` if you want to build `libprotobuf`).

		cd build_protobuf-lite
		
3. Create directory `build` and navigate in it.

		mkdir build & cd build
		
4. Create directory `release` and navigate in it.

		mkdir release & cd release
	
5. Generate configuration using `CMakeList.txt`.

		cmake -G "NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DPROTOBUF_VERSION=3.12.2 ../..
		
6. Build `libprotobuf`.

		nmake

then `libprotobuf-lite.lib` would output to directory `install/Release/`.

protobuf source has been modified. The build from original protobuf source with UE4 would fail if protobuf version is lower than `3.12`.  
Source modification details:  
version `3.5.x`: https://github.com/jashking/UE4Protobuf  
version `3.9.x`: https://github.com/kingsoftgames/protobuf-ue4/blob/master/Fix-3.9.2.bat  

##### 2. generate protoc files

1. Address to directory `test/`:

		cd test

2. execute `protoc_gen.bat`.

then `test.pb.h` and `test.pb.cc` would be outputed in directory `test/`

##### 3. build protoc C++ files ( or run test/build-windows.bat)

1. Address to directory `test/cmake/`:

		cd test/cmake/
    
2. Create directory `build` and navigate in it.

		mkdir build & cd build
	
3. Create directory `release` and navigate in it.

		mkdir release & cd release
	
4. Generate configuration using `CMakeList.txt`.

		cmake -G "NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DPROTOBUF_VERSION=3.12.2 ../..
    
5. Build your own library.

		nmake

then `libtest.lib` would output to directory `test/install/Release/`

##### 4. Extract includes 

Execute `extract_includes.bat`, then protobuf headers would be saved in directory `include`.

##### 5. Configure UE4 Build.cs

1. copy `ue4/MyProj.Build.cs` into your UE4 project: `MyProj/Source/MyProj/`

2. copy `libtest.lib` and `libprotobuf-lite.lib` into your UE4 project: `MyProj/ThirdParty/Protobuf/Library/`

3. copy google protobuf headers into your UE4 project: `MyProj/ThirdParty/Protobuf/Include/`

4. copy `test.pb.h` into your UE4 project: `MyProj/ThirdParty/Protobuf/Include/`

5. Add `bEnableExceptions = true;` inside the {ProjectName}.Build.cs constructor. 

then your can build your UE4 project with protoc C++ files.

##### Attention

If want to build other version, modify parameter `PROTOBUF_VERSION` to specified version (e.g. `-DPROTOBUF_VERSION=3.5.1`), and also modify version in `extract_includes.bat`, and replace `protoc.exe` with matched version (`3.12.2` in current repository).

### Android NDK

##### Steps

1. execute `\ndk_build\build.bat`

2. execute `test\ndk_build\build.bat`

3. copy `ndk_build\obj\local\armeabi-v7a\libprotobuf-lite-ndk.a` and `test\ndk_build\obj\local\armeabi-v7a\libtest-ndk.a` into your UE4 project: `MyProj/ThirdParty/Protobuf/Library/`

4. copy headers which are in `test\src\` into your UE4 project: `MyProj/ThirdParty/Protobuf/Include/` 

5. build your UE4 project.

### Reference

##### Offical CMakeList.txt (cpp files & included heads)

libprotobuf-lite:  
https://github.com/protocolbuffers/protobuf/blob/master/cmake/libprotobuf-lite.cmake

libprotobuf:  
https://github.com/protocolbuffers/protobuf/blob/master/cmake/libprotobuf.cmake

##### Source

Build Protobuf for Unreal Engine 4 with Jenkins Pipeline.  
https://github.com/kingsoftgames/protobuf-ue4
