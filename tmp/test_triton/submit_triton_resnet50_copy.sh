arena serve triton \
 --namespace=default-group \
 --version=22 \
 --data=bloom7b1-pvc:/models \
 --name=rrresnet50-triton \
 --allow-metrics \
 --gpus=1 \
 --replicas=1 \
 --image=nvcr.io/nvidia/tritonserver:22.08-py3 \
 --model-repository=/models/triton