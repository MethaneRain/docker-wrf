#!/bin/bash

# Grab today's 00Z init GFS Half Degree forecast 00, 03, 06Z files

currentDate=$(date +%Y%m%d)
#currentDate=20210614
echo "$currentDate"
# ftp://ftp.ncep.noaa.gov/pub/data/nccf/com/gfs/prod
echo "grabbing first file"
echo "***************************"
curl -s --disable-epsv --connect-timeout 30 -m 60 -u anonymous:USER_ID@INSTITUTION -o ./GFS_"$currentDate"_00h_00Z ftp://ftp.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$currentDate"/00/atmos/gfs.t00z.pgrb2.0p50.f000
echo "grabbing second file"
echo "***************************"
curl -s --disable-epsv --connect-timeout 30 -m 60 -u anonymous:USER_ID@INSTITUTION -o ./GFS_"$currentDate"_00h_03Z ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$currentDate"/00/atmos/gfs.t00z.pgrb2.0p50.f003
echo "grabbing third file"
echo "***************************"
curl -s --disable-epsv --connect-timeout 30 -m 60 -u anonymous:USER_ID@INSTITUTION -o ./GFS_"$currentDate"_00h_06Z ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$currentDate"/00/atmos/gfs.t00z.pgrb2.0p50.f006
echo "\nall done!"
#for  (( i=0; i<91; i+=3 )); do
#    curl -s --disable-epsv --connect-timeout 30 -m 60 -u anonymous:USER_ID@INSTITUTION -o /home/WRF/Build_WRF/DATA/GFS_"$currentDate"_00h_00Z ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$currentDate"/00/gfs.t00z.pgrb2.0p50.f000
#done
