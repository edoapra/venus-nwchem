#!/usr/bin/env bash
# check if gfortran is in your path
if ! [ -x "$(command -v gfortran)" ]; then
    echo
    echo gfortran missing from your PATH
    echo
    exit 1
else
    echo
    echo gfortran details
    echo `gfortran -v`
    echo
fi
# check if mpif90 is in your path
if ! [ -x "$(command -v mpif90)" ]; then
    echo
    echo mpif90 missing from your PATH
    echo please install MPI or
    echo modify PATH to point to your MPI installation
    echo
    exit 1
else
    echo
    echo mpif90 details
    echo `mpif90 -show`
    echo
fi
#check disk space
disk_space="$(df -k .| tail -1 | awk '/[0-9]%/{print $(4)}')"
echo
echo disk space available: $disk_space KBytes
echo
if [[  $disk_space -lt 2200000 ]]; then
    echo
    echo installation stopped since
    echo it requires 2.1GB of disk space
    echo
    exit 1
fi
# download
rm -rf 2j* aers* NWC Licence.txt
wget https://md-datasets-cache-zipfiles-prod.s3.eu-west-1.amazonaws.com/2jngk5tzm4-1.zip
unzip 2jngk5tzm4-1.zip
tar xzf aers_v1_0.tar.gz
rsync -av new/NWC/* NWC/.
cd NWC
./build-venus-nwchem.sh


