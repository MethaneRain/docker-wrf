#!/bin/bash

#tar xzvf netcdf-c-4.7.4.tar.gz     #or just .tar if no .gz present
#cd netcdf-c-4.7.4
./configure --prefix=/home/WRF/Build_WRF/LIBRARIES/netcdf --disable-dap --disable-netcdf-4 --disable-shared
make
make check
make install

echo "- - - - - - - - - - - - - - - - - - -"
echo "The following env vars must be set in the terminal before/nmoving on to building netcdf-fortran:"
echo "export PATH=\$DIR/netcdf/bin:\$PATH"
echo "export NETCDF=/home/WRF/Build_WRF/LIBRARIES/netcdf"


