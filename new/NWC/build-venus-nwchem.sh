#!/bin/bash
#git clone --depth=1 https://github.com/nwchemgit/nwchem.git
git clone --depth=1 -b venus-2022-mods https://github.com/edoapra/nwchem.git
#wget https://github.com/nwchemgit/nwchem/releases/download/v7.0.2-release/nwchem-7.0.2-release.revision-b9985dfa-srconly.2020-10-12.tar.bz2
#tar xjf nwchem-7.0.2-release.revision-b9985dfa-srconly.2020-10-12.tar.bz2
#ln -sf nwchem-7.0.2 nwchem
#exit  0
cd nwchem
export NWCHEM_TOP=`pwd`
cd src
#tar xvf  ../../patch.tar
export NWCHEM_TARGET=LINUX64
export USE_MPI=y
export USE_MPIF=y
export USE_MPIF4=y
#export NWCHEM_MODULES="qm geninterface"
make nwchem_config NWCHEM_MODULES=venus
export BUILD_OPENBLAS=1
#export USE_INTERNALBLAS=1
export BLAS_SIZE=8
make -j4  >> make.log
make link |tail -1 |      sed 's|.*stubs.o\(.*\)|\1|' > ../../venus-nwchem/libs.txt
make stubs.o
cd ../../
cd venus-nwchem
make clean > make-venus.log
make  >> make-venus.log




