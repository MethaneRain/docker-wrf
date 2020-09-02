#!/bin/bash

echo "- - - - - - - - - - - - - - - - - - - -"
echo "Test #1: Fixed Format Fortran Test"
echo ""
gfortran TEST_1_fortran_only_fixed.f
./a.out
echo ""

echo "- - - - - - - - - - - - - - - - - - - -"
echo "Test #2: Free Format Fortran"
echo ""
gfortran TEST_2_fortran_only_free.f90
./a.out
echo ""

echo "- - - - - - - - - - - - - - - - - - - -"
echo "Test #3: C: TEST_3_c_only.c"
echo ""
gcc TEST_3_c_only.c
./a.out
echo ""

echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "Test #4: Fortran Calling a C Function"
echo "(our gcc and gfortran have different defaults, "
echo "so we force both to always use 64 bit [-m64] when combining them)"
echo ""
gcc -c -m64 TEST_4_fortran+c_c.c
gfortran -c -m64 TEST_4_fortran+c_f.f90
gfortran -m64 TEST_4_fortran+c_f.o TEST_4_fortran+c_c.o
./a.out
echo ""

echo "- - - - - - - - - - - - - - - - - - - -"
echo "Test #5: csh"
echo ""
./TEST_csh.csh
echo ""

echo "- - - - - - - - - - - - - - - - - - - -"
echo "Test #6: perl"
echo ""
./TEST_perl.pl
echo ""

echo "- - - - - - - - - - - - - - - - - - - -"
echo "Test #7: sh"
echo ""
./TEST_sh.sh
echo ""

echo ""
echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo "Sweet! Hopefully all those tests passed, and if so you can move on to building and compiling the WRF!"
echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
echo ""