#!/bin/bash

export DIR=/home/WRF/Build_WRF/LIBRARIES
export CC=cc
export CXX=g++
export FC=gfortran
export FCFAGS="-m64"
export F77=gfortran
export FFLGS="-m64"
export JASERLIB=$DIR/grib2/lib
export JASERINC=$DIR/grib2/include
export LDFAGS=-L$DIR/grib2/lib
export CPPLAGS=-I$DIR/grib2/include

export CPPFLAGS=-I/home/WRF/Build_WRF/LIBRARIES/netcdf/include
export LDFLAGS=-L/home/WRF/Build_WRF/LIBRARIES/netcdf/lib

# netcdf.inc is at /home/WRF/Build_WRF/LIBRARIES/netcdf-fortran-4.5.3/fortran