#!/bin/bash

cd mpich-3.0.4
./configure --prefix=/home/WRF/Build_WRF/LIBRARIES/mpich --disable-cxx
make
make install
export PATH=$DIR/mpich/bin:$PATH
cd ..

cd libpng-1.2.50
./configure --prefix=/home/WRF/Build_WRF/LIBRARIES/grib2
make
make install
cd ..

cd jasper-1.900.1
./configure --prefix=/home/WRF/Build_WRF/LIBRARIES/grib2
make
make install

