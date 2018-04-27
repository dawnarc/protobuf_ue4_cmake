@echo off


cd cmake

mkdir build & cd build

mkdir release & cd release

cmake -G "NMake Makefiles" -DCMAKE_BUILD_TYPE=release ../..

nmake