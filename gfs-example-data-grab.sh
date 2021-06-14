#!/bin/bash

# Grab today's 00Z init GFS Half Degree forecast 00, 03, 06Z files

currentDate=$(date +%Y%m%d)
echo "$currentDate"
curl -s --disable-epsv --connect-timeout 30 -m 60 -u anonymous:USER_ID@INSTITUTION -o /home/WRF/Build_WRF/DATA/GFS_"$currentDate"_00h_00Z ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$currentDate"/00/gfs.t00z.pgrb2.0p50.f000

curl -s --disable-epsv --connect-timeout 30 -m 60 -u anonymous:USER_ID@INSTITUTION -o /home/WRF/Build_WRF/DATA/GFS_"$currentDate"_00h_03Z ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$currentDate"/00/gfs.t00z.pgrb2.0p50.f003

curl -s --disable-epsv --connect-timeout 30 -m 60 -u anonymous:USER_ID@INSTITUTION -o /home/WRF/Build_WRF/DATA/GFS_"$currentDate"_00h_06Z ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$currentDate"/00/gfs.t00z.pgrb2.0p50.f006

#for  (( i=0; i<91; i+=3 )); do
#    curl -s --disable-epsv --connect-timeout 30 -m 60 -u anonymous:USER_ID@INSTITUTION -o /home/WRF/Build_WRF/DATA/GFS_"$currentDate"_00h_00Z ftp://ftpprd.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs."$currentDate"/00/gfs.t00z.pgrb2.0p50.f000
#done
