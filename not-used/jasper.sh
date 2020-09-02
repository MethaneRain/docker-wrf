#!/bin/bash

#tar xzvf jasper-1.900.1.tar.gz     #or just .tar if no .gz present
#cd jasper-1.900.1
./configure --prefix=/home/WRF/Build_WRF/LIBRARIES/grib2
make
make install