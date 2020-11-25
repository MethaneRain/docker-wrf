FROM centos:latest
#LABEL Justin Richling <justin.richling@gmail.com>
RUN yum update -y
RUN yum install -y gcc-gfortran gdb make
#RUN yum install -y gcc-gfortran gdb make && perl gdb make &&  && &&  &&  &&  &&  &&  &&  && 
RUN yum install -y perl gdb make
RUN yum install -y csh gdb make
RUN yum install -y tcsh gdb make
RUN yum install -y m4 gdb make
RUN yum install -y nano gdb make
RUN yum install -y diffutils gdb make
RUN yum install -y zlib-devel gdb make
RUN yum install -y zlib gdb make
RUN yum install -y unzip gdb make
RUN yum install -y time gdb make
RUN yum install -y which
#RUN yum install -y openmpi-devel
RUN yum install -y libtool autoconf pkg-config automake tcsh

#RUN curl http://sourceforge.net/projects/espeak/files/espeak/espeak-1.48/espeak-1.48.04-source.zip --output home/espeak-1.48.04-source.zip
#RUN unzip home/espeak-1.48.04-source.zip

RUN mkdir home/WRF
RUN mkdir home/WRF/Build_WRF && mkdir home/WRF/TESTS && mkdir home/WRF/Build_WRF/LIBRARIES && mkdir /home/WRF/Build_WRF/DATA 
COPY set-env-names.sh home/WRF/Build_WRF/LIBRARIES/

#COPY jasper.sh home/WRF/Build_WRF/LIBRARIES/
#COPY libpng.sh home/WRF/Build_WRF/LIBRARIES/
#COPY mpich.sh home/WRF/Build_WRF/LIBRARIES/
#COPY zlib.sh home/WRF/Build_WRF/LIBRARIES/
COPY netcdf-c.sh home/WRF/Build_WRF/LIBRARIES/
COPY netcdf-f.sh home/WRF/Build_WRF/LIBRARIES/
COPY WRF-4.2.1.zip home/WRF/
COPY WPS-4.2.zip home/WRF/
COPY fortran-c-test.sh home/WRF/TESTS
COPY library-build.sh home/WRF/Build_WRF/LIBRARIES/
COPY library-compatibility-test.sh home/WRF/TESTS

RUN curl https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/Fortran_C_tests.tar --output home/WRF/TESTS/Fortran_C_tests.tar
RUN curl https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/mpich-3.0.4.tar.gz --output home/WRF/Build_WRF/LIBRARIES/mpich-3.0.4.tar.gz
RUN curl https://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-c-4.7.4.tar.gz --output home/WRF/Build_WRF/LIBRARIES/netcdf-c-4.7.4.tar.gz
RUN curl https://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-fortran-4.5.3.tar.gz --output home/WRF/Build_WRF/LIBRARIES/netcdf-fortran-4.5.3.tar.gz
RUN curl https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/jasper-1.900.1.tar.gz --output home/WRF/Build_WRF/LIBRARIES/jasper-1.900.1.tar.gz
RUN curl https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/libpng-1.2.50.tar.gz --output home/WRF/Build_WRF/LIBRARIES/libpng-1.2.50.tar.gz
RUN curl https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/zlib-1.2.7.tar.gz --output home/WRF/Build_WRF/LIBRARIES/zlib-1.2.7.tar.gz
RUN curl https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/Fortran_C_NETCDF_MPI_tests.tar --output home/WRF/TESTS/Fortran_C_NETCDF_MPI_tests.tar
RUN curl https://www2.mmm.ucar.edu/wrf/src/wps_files/geog_high_res_mandatory.tar.gz --output home/WRF/Build_WRF/geog.tar.gz

#RUN cd home/WRF/Build_WRF/
#RUN gunzip home/WRF/Build_WRF/geog.tar.gz
#RUN tar -xf home/WRF/Build_WRF/geog.tar
#RUN mv home/WRF/Build_WRF/geog home/WRF/Build_WRF/WPS_GEOG
RUN tar -xf home/WRF/TESTS/Fortran_C_tests.tar -C home/WRF/TESTS/

RUN tar xzvf home/WRF/Build_WRF/LIBRARIES/jasper-1.900.1.tar.gz -C home/WRF/Build_WRF/LIBRARIES/
RUN tar xzvf home/WRF/Build_WRF/LIBRARIES/libpng-1.2.50.tar.gz -C home/WRF/Build_WRF/LIBRARIES/
RUN tar xzvf home/WRF/Build_WRF/LIBRARIES/mpich-3.0.4.tar.gz -C home/WRF/Build_WRF/LIBRARIES/
RUN tar xzvf home/WRF/Build_WRF/LIBRARIES/netcdf-c-4.7.4.tar.gz -C home/WRF/Build_WRF/LIBRARIES/
RUN tar xzvf home/WRF/Build_WRF/LIBRARIES/netcdf-fortran-4.5.3.tar.gz -C home/WRF/Build_WRF/LIBRARIES/
RUN tar xzvf home/WRF/Build_WRF/LIBRARIES/zlib-1.2.7.tar.gz -C home/WRF/Build_WRF/LIBRARIES/
RUN tar -xf home/WRF/TESTS/Fortran_C_NETCDF_MPI_tests.tar -C home/WRF/TESTS/

#RUN unzip home/WRF/WRF-4.2.1.zip
#RUN unzip home/WRF/WPS-4.2.zip

RUN chmod +x home/WRF/Build_WRF/LIBRARIES/netcdf-c.sh
RUN chmod +x home/WRF/Build_WRF/LIBRARIES/netcdf-f.sh
RUN chmod +x home/WRF/TESTS/fortran-c-test.sh
RUN chmod +x home/WRF/TESTS/library-compatibility-test.sh
RUN chmod +x home/WRF/Build_WRF/LIBRARIES/library-build.sh
#RUN chmod +x home/WRF/Build_WRF/LIBRARIES/mpich.sh
#RUN chmod +x home/WRF/Build_WRF/LIBRARIES/zlib.sh
#RUN chmod +x home/WRF/Build_WRF/LIBRARIES/libpng.sh
#RUN chmod +x home/WRF/Build_WRF/LIBRARIES/jasper.sh

#RUN . home/WRF/Build_WRF/LIBRARIES/set-env-names.sh

