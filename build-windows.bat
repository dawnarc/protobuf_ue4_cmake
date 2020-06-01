@echo off


cd build_protobuf

mkdir build & cd build

mkdir release & cd release

cmake -G "NMake Makefiles" -DCMAKE_BUILD_TYPE=Release -DPROTOBUF_VERSION=3.12.2 ../..

nmake