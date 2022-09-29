## The VENUS/NWChem software package. Tight coupling between chemical dynamics simulations and electronic structure theory  
[DOI:10.17632/2jngk5tzm4.1](http://dx.doi.org/10.17632/2jngk5tzm4.1)  
Versions of this program held in the CPC repository in Mendeley Data
 AERS_v1_0; VENUS/NWChem; 10.1016/j.cpc.2013.11.011  
https://data.mendeley.com/datasets/2jngk5tzm4/1

### Quick start
```
 git clone https://github.com/edoapra/venus-nwchem
 cd venus-nwchem
 ./download_and_build.sh
 ```
 
 ### Example
 
Once the code is installed, test input files are present in the `test` directory.  
To execute, type the following command from the `test` directory
```
 mpirun -np 2 ../NWC/venus-nwchem/ven_nw.e < Input.dt
 ```


