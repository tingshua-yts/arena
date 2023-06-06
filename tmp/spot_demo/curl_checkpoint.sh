# job=$1

curl --http0.9 ${job}-worker-0:9009/stop
curl --http0.9 ${job}-worker-1:9009/stop
curl --http0.9 ${job}-worker-2:9009/stop

