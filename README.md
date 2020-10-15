<h2>Welcome to my very basic WRF Docker build!</h2>

This Docker image is meant to be a basic test of my Docker building abilities as well as my replication of <a href="https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compilation_tutorial.php">NCAR's MMM WRF basic build</a> on a fresh Linux CentOS environment. 

- - -

To begin, start by changing to the ```/home/WRF/Build_WRF/LIBRARIES``` directory, which is where all the WRF library files are located.
- - -

First thing to do is to set some of the environment variables.
In the ```home/WRF/Build_WRF/LIBRARIES``` directory 
* Run ```. set-env-names.sh```
- - -

It is necessary to check the that all the compilers (gcc, gfortran, etc) have been downloaded and created successfully.
* Start by switching to the ```/home/WRF/TESTS``` directory.
* Then run ```./fortran-c-test.sh```
There should be 7 tests that all have some kind of SUCCESS statement. If so, then all is well and can move on to building the necessary libraries.
- - -

Next is to check the that the libraries have been downloaded and then build them successfully.
* Start by switching to the ```/home/WRF/Build_WRF/LIBRARIES```

The netCDF library needs to be built, and now the netcdf-c and netcdf-fortran have to be built independently with netcdf-c first.
* Change to the ```/home/WRF/Build_WRF/LIBRARIES/netcdf-c-4.7.4``` directory.
* Run ```./netcdf-c.sh```

Note: After successfully building the netcdf-c library, there will be a message about creating two netcdf env variables:

* ```export PATH=$DIR/netcdf/bin:$PATH```
* ```export NETCDF=/home/WRF/Build_WRF/LIBRARIES/netcdf```

Next, change to the ```/home/WRF/Build_WRF/LIBRARIES/netcdf-fortran-4.5.3/``` directory 
* Run ```./netcdf-f.sh```

After the build, the ```netcdf.inc``` must be linked from the ```netcdf-fortran-4.5.3``` to the ```netcdf``` directory.
* Run ```ln -s /home/WRF/Build_WRF/LIBRARIES/netcdf-fortran-4.5.3/fortran/netcdf.inc /home/WRF/Build_WRF/LIBRARIES/netcdf/netcdf.inc```

Change back to ```/home/WRF/Build_WRF/LIBRARIES/```
* Then run ```./library-build.sh```

This may take ~10 mins??
- - -

To configure the WRF, cd to ```/home/WRF/WRF-4.2.1/```.
* Run ```./configure```

Then you must assign the configuration based off your system.
```
Please select from among the following Linux x86_64 options:

  1. (serial)   2. (smpar)   3. (dmpar)   4. (dm+sm)   PGI (pgf90/gcc)
  5. (serial)   6. (smpar)   7. (dmpar)   8. (dm+sm)   PGI (pgf90/pgcc): SGI MPT
  9. (serial)  10. (smpar)  11. (dmpar)  12. (dm+sm)   PGI (pgf90/gcc): PGI accelerator
 13. (serial)  14. (smpar)  15. (dmpar)  16. (dm+sm)   INTEL (ifort/icc)
                                         17. (dm+sm)   INTEL (ifort/icc): Xeon Phi (MIC architecture)
 18. (serial)  19. (smpar)  20. (dmpar)  21. (dm+sm)   INTEL (ifort/icc): Xeon (SNB with AVX mods)
 22. (serial)  23. (smpar)  24. (dmpar)  25. (dm+sm)   INTEL (ifort/icc): SGI MPT
 26. (serial)  27. (smpar)  28. (dmpar)  29. (dm+sm)   INTEL (ifort/icc): IBM POE
 30. (serial)               31. (dmpar)                PATHSCALE (pathf90/pathcc)
 32. (serial)  33. (smpar)  34. (dmpar)  35. (dm+sm)   GNU (gfortran/gcc)
 36. (serial)  37. (smpar)  38. (dmpar)  39. (dm+sm)   IBM (xlf90_r/cc_r)
 40. (serial)  41. (smpar)  42. (dmpar)  43. (dm+sm)   PGI (ftn/gcc): Cray XC CLE
 44. (serial)  45. (smpar)  46. (dmpar)  47. (dm+sm)   CRAY CCE (ftn $(NOOMP)/cc): Cray XE and XC
 48. (serial)  49. (smpar)  50. (dmpar)  51. (dm+sm)   INTEL (ftn/icc): Cray XC
 52. (serial)  53. (smpar)  54. (dmpar)  55. (dm+sm)   PGI (pgf90/pgcc)
 56. (serial)  57. (smpar)  58. (dmpar)  59. (dm+sm)   PGI (pgf90/gcc): -f90=pgf90
 60. (serial)  61. (smpar)  62. (dmpar)  63. (dm+sm)   PGI (pgf90/pgcc): -f90=pgf90
 64. (serial)  65. (smpar)  66. (dmpar)  67. (dm+sm)   INTEL (ifort/icc): HSW/BDW
 68. (serial)  69. (smpar)  70. (dmpar)  71. (dm+sm)   INTEL (ifort/icc): KNL MIC
 72. (serial)  73. (smpar)  74. (dmpar)  75. (dm+sm)   FUJITSU (frtpx/fccpx): FX10/FX100 SPARC64 IXfx/Xlfx
```

Then choose nesting options:
```
Compile for nesting? (0=no nesting, 1=basic, 2=preset moves, 3=vortex following) [default 0]:
```
- - -

After the successful configuration of the WRF, the next step is to compile the WRF. There are built in compile options in the ```/home/WRF/WRF-4.2.1``` directory:
* Run ```./compile``` and the output below:
```
Usage:
 
   compile [-j n] wrf   compile wrf in run dir (NOTE: no real.exe, ndown.exe, or ideal.exe generated)
 
   or choose a test case (see README_test_cases for details) :
      compile [-j n] em_b_wave
      compile [-j n] em_convrad
      compile [-j n] em_esmf_exp
      compile [-j n] em_fire
      compile [-j n] em_grav2d_x
      compile [-j n] em_heldsuarez
      compile [-j n] em_hill2d_x
      compile [-j n] em_les
      compile [-j n] em_quarter_ss
      compile [-j n] em_real
      compile [-j n] em_scm_xy
      compile [-j n] em_seabreeze2d_x
      compile [-j n] em_squall2d_x
      compile [-j n] em_squall2d_y
      compile [-j n] em_tropical_cyclone
      compile [-j n] nmm_real
      compile [-j n] nmm_tropical_cyclone
 
  compile -j n               parallel make using n tasks if supported (default 2)
  compile -h                 help message
```
To compile any of these cases:
* Run ```./compile case_name >& log.compile``` to write it to a compile log file.

The time it takes to compile these cases is typically 20-40 minutes! The last test case I ran took:

```[root@348b3977f4fc WRF-4.2.1]# time ./compile em_hill2d_x >& log.compile

real	18m37.819s
user	33m6.647s
sys	1m28.937s
```
To verify if the compilation succeeded, there are several ```.exe``` files that are build and placed in the ```main``` directory. These can checked by running ```ls -ls main/*.exe```. The sample case I ran above produced:

```
33856 -rwxr-xr-x 1 root root 34666800 Sep  1 18:15 main/ideal.exe
38960 -rwxr-xr-x 1 root root 39894360 Sep  1 18:14 main/wrf.exe
```

This compilation produced the standard ```wrf.exe``` and an since I ran the ideal case ```em_hill2d_x``` produced a ```ideal.exe``` file.

If you compiled a real case, you should see:

---
* ```wrf.exe``` (model executable)
* ```real.exe``` (real data initialization)
* ```ndown.exe``` (one-way nesting)
* ```tc.exe``` (for tc bogusing--serial only)

If you compiled an idealized case, you should see:

---
* ```wrf.exe``` (model executable)
* ```ideal.exe``` (ideal case initialization)

Here are the different cases:

em_real (3d real case)<br>
em_quarter_ss (3d ideal case)<br>
em_b_wave (3d ideal case)<br>
em_les (3d ideal case)<br>
em_heldsuarez (3d ideal case)<br>
em_tropical_cyclone (3d ideal case)<br>
em_hill2d_x (2d ideal case)<br>
em_squall2d_x (2d ideal case)<br>
em_squall2d_y (2d ideal case)<br>
em_grav2d_x (2d ideal case)<br>
em_seabreeze2d_x (2d ideal case)<br>
em_scm_xy (1d ideal case)

- - -

If you have made it this far, congratulations!! 

The next hurdle is configuring the WPS (WRF Preprocessing System) needed to finally run the WRF model!

```export JASPERLIB=$DIR/grib2/lib```

```export JASPERINC=$DIR/grib2/include```

The path to the compiled WRF will need to be set in an environment variable:

```export WRF_DIR=/home/WRF/WRF-4.2.1```

- - -

Now we are ready to configure and compile the WPS. Change to the ```/home/WRF/WPS-4.2/``` directory.

* Clean any previous builds with ```./clean```
* Configure WPS ```./configure```

Set option based off your configuration:
```
------------------------------------------------------------------------
Please select from among the following supported platforms.

   1.  Linux x86_64, gfortran    (serial)
   2.  Linux x86_64, gfortran    (serial_NO_GRIB2)
   3.  Linux x86_64, gfortran    (dmpar)
   4.  Linux x86_64, gfortran    (dmpar_NO_GRIB2)
   5.  Linux x86_64, PGI compiler   (serial)
   6.  Linux x86_64, PGI compiler   (serial_NO_GRIB2)
   7.  Linux x86_64, PGI compiler   (dmpar)
   8.  Linux x86_64, PGI compiler   (dmpar_NO_GRIB2)
   9.  Linux x86_64, PGI compiler, SGI MPT   (serial)
  10.  Linux x86_64, PGI compiler, SGI MPT   (serial_NO_GRIB2)
  11.  Linux x86_64, PGI compiler, SGI MPT   (dmpar)
  12.  Linux x86_64, PGI compiler, SGI MPT   (dmpar_NO_GRIB2)
  13.  Linux x86_64, IA64 and Opteron    (serial)
  14.  Linux x86_64, IA64 and Opteron    (serial_NO_GRIB2)
  15.  Linux x86_64, IA64 and Opteron    (dmpar)
  16.  Linux x86_64, IA64 and Opteron    (dmpar_NO_GRIB2)
  17.  Linux x86_64, Intel compiler    (serial)
  18.  Linux x86_64, Intel compiler    (serial_NO_GRIB2)
  19.  Linux x86_64, Intel compiler    (dmpar)
  20.  Linux x86_64, Intel compiler    (dmpar_NO_GRIB2)
  21.  Linux x86_64, Intel compiler, SGI MPT    (serial)
  22.  Linux x86_64, Intel compiler, SGI MPT    (serial_NO_GRIB2)
  23.  Linux x86_64, Intel compiler, SGI MPT    (dmpar)
  24.  Linux x86_64, Intel compiler, SGI MPT    (dmpar_NO_GRIB2)
  25.  Linux x86_64, Intel compiler, IBM POE    (serial)
  26.  Linux x86_64, Intel compiler, IBM POE    (serial_NO_GRIB2)
  27.  Linux x86_64, Intel compiler, IBM POE    (dmpar)
  28.  Linux x86_64, Intel compiler, IBM POE    (dmpar_NO_GRIB2)
  29.  Linux x86_64 g95 compiler     (serial)
  30.  Linux x86_64 g95 compiler     (serial_NO_GRIB2)
  31.  Linux x86_64 g95 compiler     (dmpar)
  32.  Linux x86_64 g95 compiler     (dmpar_NO_GRIB2)
  33.  Cray XE/XC CLE/Linux x86_64, Cray compiler   (serial)
  34.  Cray XE/XC CLE/Linux x86_64, Cray compiler   (serial_NO_GRIB2)
  35.  Cray XE/XC CLE/Linux x86_64, Cray compiler   (dmpar)
  36.  Cray XE/XC CLE/Linux x86_64, Cray compiler   (dmpar_NO_GRIB2)
  37.  Cray XC CLE/Linux x86_64, Intel compiler   (serial)
  38.  Cray XC CLE/Linux x86_64, Intel compiler   (serial_NO_GRIB2)
  39.  Cray XC CLE/Linux x86_64, Intel compiler   (dmpar)
  40.  Cray XC CLE/Linux x86_64, Intel compiler   (dmpar_NO_GRIB2)

Enter selection [1-40] :

```

Finally compile the WPS ```./compile >& log.compile```

There should now be 3 executable files: 
1) ```geogrid.exe``` 
2) ```ungrib.exe```
3) ```metgrid.exe```

- - -

Next the static geography data must be pointed to downloaded data so the ```geogrid.exe``` file can be run: 

While still in the ```/home/WRF/WPS-4.2/``` directory edit the ```namelist.wps``` file
* ```nano namelist.wps``` and change: ```geog_data_path = /home/WRF/Build_WRF/WPS_GEOG```

- - - 

For real cases there must be input data ingested. NCAR's MMM tutorial uses GFS quarter degree data. This Docker image contains some sample data for the 2020-09-13 GFS 00, 03, 06Z forecast hours from the 00Z run in the ```/home/WRF/Build_WRF/DATA/``` directory. Or for the current day's 00Z initialization hour, you can use the ```curl``` command to grab some data as well by running the ```gfs-example-data-grab.sh``` file.

Change to ```/home/WRF/Build_WRF/```
* Run ```./gfs-example-data-grab.sh```

This will grab the 00, 03, and 06Z forecast hours from the 00Z init hour for the current day's run (GFS quarter degree) and place the data in the ```/home/WRF/Build_WRF/DATA/``` directory for the WPS to find.

- - -

Next is to run the 3 executable files built from compiling the WPS. Change back to the ```/home/WRF/WRF-4.2.1``` directory:

Geogrid:

* The execute the geogrid file
```./geogrid.exe >& log.geogrid```

* Then link to the input data:
```./link_grib.csh /home/WRF/Build_WRF/DATA/```

* Finally:
```ln -sf ungrib/Variable_Tables/Vtable.GFS Vtable```
- - -

Ungrib:
This will take several minutes and produce files starting with ```FILE*```
for ```ungrib.exe``` another path must be set
* ```export LD_LIBRARY_PATH=$DIR/grib2/lib:$LD_LIBRARY_PATH```
* Then run ```./ungrib.exe```
- - -

Metgrid:
The final executable to run is the ```metgrid.exe```
* Run ```./metgrid.exe >& log.metgrid```

This should produce some ```met*``` netcdf files 
- - -

Now that the WRF and WPS have been successfully configured and compiled, change to the ```/home/WRF/WRF-4.2.1/run``` directory

** The dates will also need to be changed in the ```/home/WRF/WPS-4.2/namelist.wps``` and ```/home/WRF/WRF-4.2.1/run/namelist.input``` files. There is a shell script that can automatically change these, to be added in the future... **<br>

The vertical levels for GFS will need to be changed in the ```namelist.input``` file:
* ```num_metgrid_levels``` is set to 32, but for sample quarter degree GFS it is 34.

The ```met_em*``` files in the ```/home/WRF/WPS-4.2/``` directory need to be linked to the WRF/run directory
* ```ln -sf ../../WPS-4.2/met_em* .```

Now the real case is ready to executed!
* For the real case, run ```./real.exe``` (similar for the ideal cases)



And finally, run the WRF executable ```wrf.exe```
* Run ```./wrf.exe```

This should take roughly 30 minutes, here is the time for the last real case I ran with executing the ```wrf.exe```:
```
real	29m22.727s
user	29m13.711s
sys	0m4.188s
```

Ensure that the WRF ran successfully by chekcing for ```wrfout*.nc``` files:
* Run ```ls wrfout*```

```
wrfout_d01_2020-09-13_00:00:00
```
<strong>And thats it! Congratulations on successfully building the basic WRF build via my Docker image and container!</strong>
- - -

One last cool feature of Docker is the ability to copy files/folders from the Docker container to your local machine. All you need is path of the file in the Docker container and the container ID which can be found be running ```docker ps```

Example: in your local terminal, run:
* ```docker cp <container ID>:/home/WRF/WRF-4.2.1/run/wrfout_d01_2020-09-04_00:00:00 /path/on/local/machine/```

This will grab the WRF output file after running the built WRF model and now you can explore and plot the data!

Included in the Image is a sample WRF outfile: ```wrfout_d01_2020-09-13_00:00:00```

If you have WRF-Python library installed or other Python scripts/notebooks dealing with this specific data type then you can instantly begin exploring the data regardless of if your build works. 
- - -
<br>

<h3>Websites</h3>

---

<a href="https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compilation_tutorial.php">MMM Build Tutorial Home</a>

<a href="http://www2.mmm.ucar.edu/wrf/users/download/get_source.html">Source Code</a>

<a href="Static Geography Data">Static Geography Data</a>
