cp ${NETCDF}/include/netcdf.inc .
echo "- - - - - - - - - - - - - - - - - - - -"
echo "Test #1: Fortran + C + NetCDF"
echo ""
gfortran -c 01_fortran+c+netcdf_f.f
gcc -c 01_fortran+c+netcdf_c.c
gfortran 01_fortran+c+netcdf_f.o 01_fortran+c+netcdf_c.o \
     -L${NETCDF}/lib -lnetcdff -lnetcdf
./a.out

echo ""
echo "- - - - - - - - - - - - - - "
echo "Test #2: Fortran + C + NetCDF + MPI (May not succeed based on prarllel processing assignment)"
echo ""

cp ${NETCDF}/include/netcdf.inc .
mpif90 -c 02_fortran+c+netcdf+mpi_f.f
mpicc -c 02_fortran+c+netcdf+mpi_c.c
mpif90 02_fortran+c+netcdf+mpi_f.o \
02_fortran+c+netcdf+mpi_c.o \
     -L${NETCDF}/lib -lnetcdff -lnetcdf
mpirun ./a.out