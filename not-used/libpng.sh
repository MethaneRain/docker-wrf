#!/bin/bash

#tar xzvf libpng-1.2.50.tar.gz     #or just .tar if no .gz present
#cd libpng-1.2.50
./configure --prefix=/home/WRF/Build_WRF/LIBRARIES/grib2
make
make install