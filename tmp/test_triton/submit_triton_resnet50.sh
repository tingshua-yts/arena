arena serve triton \
 --namespace=default-group \
 --version=vvvv \
 --data=bloom7b1-pvc:/models \
 --name=resnet50-triton \
 --allow-metrics \
 --gpus=1 \
 --replicas=1 \
 --image=ai-studio-registry.cn-beijing.cr.aliyuncs.com/kube-ai/triton:20.12-py3 \
 --model-repository=/models/triton