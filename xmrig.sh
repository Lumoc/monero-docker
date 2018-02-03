#!/bin/bash

sysctl vm.nr_hugepages=128

if [ -z "$numthreads" ]
then
      echo "\$numthreads is empty"
      numthreads=$(nproc)
else
      echo "\$numthreads is NOT empty"
fi

if [ -z "$startport" ]
then
      echo "\$startport is empty"
      startport=8100
else
      echo "\$startport is NOT empty"
fi

if [ -z "$xmrpool" ]
then
      echo "\$xmrpool is empty"
      xmrpool=xmr-usa.dwarfpool.com
      echo Using $xmrpool
else
      echo "\$xmrpool is NOT empty"
      echo Using --- $xmrpool
fi

if [ -z "$password" ]
then
      echo "\$password is empty"
      password=x
      echo Using --- $password
else
      echo "\$password is NOT empty"
fi
cd /home/
wget http://files.linux-bench.com/mine/xmrig.tar.gz
tar xzvf xmrig.tar.gz
cd xmrig                                                                        
mkdir build                                                                     
cd build                                                                        
cmake ..                                                                        
make -j$(nproc)                                                                 
#./xmrig -o stratum+tcp://$xmrpool:$startport -u $username -p $email -t $numthre
ads                                                                             
if [ -z "$donate" ]                                                             
then                                                                            
      echo "\$donate is empty"                                                  
      ./xmrig -o stratum+tcp://$xmrpool:$startport -u $username -p $password -t 
$numthreads                                                                     
      echo -o stratum+tcp://$xmrpool:$startport -u $username -p $password -t $nu
mthreads                                                                        
else                                                                            
      echo "\$donate is NOT empty"                                              
      echo -o stratum+tcp://$xmrpool:$startport -u $username -p $password -t $nu
mthreads --donate-level=$donate                                                 
      ./xmrig -o stratum+tcp://$xmrpool:$startport -u $username -p $password -t 
$numthreads --donate-level=$donate                                              
fi                                                                              
                          