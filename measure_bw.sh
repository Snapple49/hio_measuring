echo 'time,out (kBit/s),in (kBit/s)' >> network_bw.csv
i=0;
txold="$(</sys/class/net/ens3/statistics/tx_bytes)"; 
rxold="$(</sys/class/net/ens3/statistics/rx_bytes)"; 
dkold="$(</sys/class/net/docker0/statistics/rx_bytes)"; 
while $(sleep 1); do
rxnow=$(</sys/class/net/ens3/statistics/rx_bytes); 
txnow=$(</sys/class/net/ens3/statistics/tx_bytes); 
dknow=$(</sys/class/net/docker0/statistics/rx_bytes); 
echo $i','$((($txnow-$txold-($dknow-$dkold))*8/(1024)))','$((($rxnow-$rxold)*8/(1024))) >> network_bw.csv; 
txold=$txnow; 
rxold=$rxnow; 
dkold=$dknow; 
i=$(($i+1));
done
