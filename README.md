Welcome to my very basic WRF Docker build! 

This Docker image is meant to be a basic test of my Docker building abilities as well as my replication of NCAR's MMM WRF basic build on a Linux CentOS environment. 

To begin, start by changing to the ```/home/WRF/Build_WRF/LIBRARIES``` directory, which is where all the WRF library files are located.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

First thing to do is to set some of the environment variables.
* in the ```home/WRF/Build_WRF/LIBRARIES``` directory run ```. set-env-names.sh```
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

It is necessary to check the that the compilers have been downloaded and created successfully.
* Start by switching to the ```/home/WRF/TESTS``` directory.
* Then run ```./fortran-c-test.sh```
There should be 7 tests that all have some kind of SUCCESS statement. If so, then all is well and can move on to building the necessary libraries.
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

Next is to check the that the libraries have been downloaded and then build them successfully.
* Start by switching to the ```/home/WRF/Build_WRF/LIBRARIES```

The netCDF library needs to be built, and now the netcdf-c and netcdf-fortran have to be built independently with netcdf-c first.
* Change to the ```/home/WRF/Build_WRF/LIBRARIES/netcdf-c-4.7.4``` directory.
* Run ```../netcdf-c.sh``` -> the ```.sh``` file is in the directory above, hence the ```../```!
Note: After successfully building the netcdf-c library, there will be a message about creating two netcdf env variables!
```export PATH=$DIR/netcdf/bin:$PATH```
```export NETCDF=/home/WRF/Build_WRF/LIBRARIES/netcdf```

* Next, change to the ```/home/WRF/Build_WRF/LIBRARIES/netcdf-fortran-4.5.3``` directory 
* Run ```../netcdf-f.sh``` -> the ```.sh``` file is in the directory above, hence the ```../```!
After the build, one must now link the ```netcdf.inc``` from the ```netcdf-fortran-4.5.3``` to the ```netcdf``` directory.
* Run ```ln -s /home/WRF/Build_WRF/LIBRARIES/netcdf-fortran-4.5.3/fortran/netcdf.inc /home/WRF/Build_WRF/LIBRARIES/netcdf/netcdf.inc```

* Finally, change back to ```/home/WRF/Build_WRF/LIBRARIES/```
* Then run ```./library-build.sh```
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

Now the WRF source code must be unzipped. First change to the ```/home/WRF``` directory.
* Then, run ```unzip WRF-4.2.1.zip```
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

To configure the WRF, cd to WRF-4.2.1.
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


- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

After the successful configuration of the WRF, the next step is to compile the WRF. There are built in compile options in the ```/home/WRF/WRF-4.2.1```directory:
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
* To compile any of these cases run ```./compile case_name >& log.compile``` to write it to a compile log file.
The time it takes to compile these cases is typically 20-40 minutes! The last test case I ran took:

```[root@348b3977f4fc WRF-4.2.1]# time ./compile em_hill2d_x >& log.compile

real	18m37.819s
user	33m6.647s
sys	1m28.937s
```
To verify if the compilation succeeded, there are several ```.exe``` files that are build an placed in the ```main``` directory and that can checked by running ```ls -ls main/*.exe```. The sample case I ran above produced:

```
33856 -rwxr-xr-x 1 root root 34666800 Sep  1 18:15 main/ideal.exe
38960 -rwxr-xr-x 1 root root 39894360 Sep  1 18:14 main/wrf.exe
```

This compilation produced the standard ```wrf.exe``` and an since I ran the ideal case ```em_hill2d_x``` produced a ```ideal.exe```.

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

em_real (3d real case)
em_quarter_ss (3d ideal case)
em_b_wave (3d ideal case)
em_les (3d ideal case)
em_heldsuarez (3d ideal case)
em_tropical_cyclone (3d ideal case)
em_hill2d_x (2d ideal case)
em_squall2d_x (2d ideal case)
em_squall2d_y (2d ideal case)
em_grav2d_x (2d ideal case)
em_seabreeze2d_x (2d ideal case)
em_scm_xy (1d ideal case)

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

If you have made it this far, congratulations!! The next hurdle is configuring the WPS (WRF Preprocessing System) needed to finally run the WRF model!

```export JASPERLIB=$DIR/grib2/lib```
```export JASPERINC=$DIR/grib2/include```

The path to the compiled WRF will need to be set in an environment variable:
```export WRF_DIR=/home/WRF/WRF-4.2.1```







- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
cd to ~/WRF/Build_WRF

gunzip geog.tar.gz
tar -xf geog.tar
mv geog WPS_GEOG

nano namelist.wps and change:
```geog_data_path = /home/WRF/Build_WRF/WPS_GEOG```


- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

<h3>Websites</h3>

---

<a href=""></a>

<a href=""></a>

<a href="Static Geography Data">https://www2.mmm.ucar.edu/wrf/users/download/get_sources_wps_geog.html</a>
