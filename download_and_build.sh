#!/usr/bin/env bash
# check if gfortran is in your path
if ! [ -x "$(command -v gfortran)" ]; then
    echo
    echo gfortran missing from your PATH
    echo
    exit 1
else
    echo
    echo gfortran details  `gfortran -v`
    echo
fi
# check if mpif90 is in your path
if ! [ -x "$(command -v mpif90)" ]; then
    echo
    echo mpif90 missing from your PATH
    echo please install MPI
    echo
    exit 1
else
    echo
    echo mpif90 details  `mpif90 -show`
    echo
fi
#check disk space
wget https://md-datasets-cache-zipfiles-prod.s3.eu-west-1.amazonaws.com/2jngk5tzm4-1.zip
unzip 2jngk5tzm4-1.zip
tar xzf aers_v1_0.tar.gz
rsync -av new/NWC/* NWC/.
cd NWC
./build-venus-nwchem.sh


