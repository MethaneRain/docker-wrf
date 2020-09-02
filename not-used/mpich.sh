#!/bin/bash

#tar xzvf mpich-3.0.4.tar.gz     #or just .tar if no .gz present
#cd mpich-3.0.4
./configure --prefix=/home/WRF/Build_WRF/LIBRARIES/mpich --disable-cxx
make
make install
export PATH=$DIR/mpich/bin:$PATH