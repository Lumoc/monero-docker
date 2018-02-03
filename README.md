"# monero-docker"

Here is the actual launch command we are using:

./xmrig -o stratum+tcp://$xmrpool:$startport -u $username -p $password -t $numthreads --donate-level=$donate

All four variables other than $username have default values. Username does not since that is your wallet address that you need to earn proceeds from mining.

These four variables are passed to a Docker container as environment variables (“-e”). As a quick rundown in your docker run command you would have:

-e xmrpool=<pool address>
-e startport=<pool port>
-e username=<username field usually wallet address or wallet.workerID>
-e password=<password, x or e-mail usually>
-e numthreads=<number of threads to use>
-e donate=<percentage of mining time to donate to the xmrig developers in whole integer>
