echo 'time,out (kBit/s),in (kBit/s)' >> network_bw.csv
i=0;
txold="$(</sys/class/net/ens3/statistics/tx_bytes)"; 
rxold="$(</sys/class/net/ens3/statistics/rx_bytes)"; 
while $(sleep 1); do
rxnow=$(</sys/class/net/ens3/statistics/rx_bytes); 
txnow=$(</sys/class/net/ens3/statistics/tx_bytes); 
echo $i','$((($txnow-$txold)*8/(1024)))','$((($rxnow-$rxold)*8/(1024))) >> network_bw.csv; 
txold=$txnow; 
rxold=$rxnow;
i=$(($i+1));
done
