wget https://md-datasets-cache-zipfiles-prod.s3.eu-west-1.amazonaws.com/2jngk5tzm4-1.zip
unzip 2jngk5tzm4-1.zip
tar xzf aers_v1_0.tar.gz
rsync -av new/NWC/* NWC/.
cd NWC
./build-venus-nwchem.sh


