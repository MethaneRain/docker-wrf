#!/bin/bash

# This section may not be needed if zlib is installed by yum in the Dockerfile

#tar xzvf zlib-1.2.7.tar.gz     #or just .tar if no .gz present
#cd zlib-1.2.7
./configure --prefix=/home/WRF/Build_WRF/LIBRARIES/grib2
make
make install