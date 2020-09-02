#tar xzvf netcdf-fortran-4.5.3.tar.gz     #or just .tar if no .gz present
#cd netcdf-fortran-4.5.3
#./configure --prefix=/home/WRF/Build_WRF/LIBRARIES/netcdf/lib --disable-dap --disable-netcdf-4 --disable-fortran-type-check -disable-shared 
./configure --prefix=/home/WRF/Build_WRF/LIBRARIES/netcdf/ --disable-dap --disable-netcdf-4 --disable-fortran-type-check -disable-shared 

#./configure --prefix=/home/WRF/Build_WRF/LIBRARIES/netcdf/lib --disable-dap --disable-netcdf-4 --disable-fortran-type-check -disable-shared $(nc-config --libs --static) $(nc-config --cflags)


#./configure --prefix=/home/oriol/wrf-compiled/opt/netcdf-4.7.3/lib 
#--disable-shared $(nc-config --libs --static) $(nc-config --cflags)
make
make check
make install

echo ""
echo "Make sure to link the netcdf.inc by running ln -s /home/WRF/Build_WRF/LIBRARIES/netcdf-fortran-4.5.3/fortran/netcdf.inc /home/WRF/Build_WRF/LIBRARIES/netcdf/netcdf.inc"
echo ""