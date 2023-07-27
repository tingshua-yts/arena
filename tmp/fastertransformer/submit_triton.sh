arena serve triton \
 --namespace=default-group \
 --version=1 \
 --data=bloom7b1-pvc:/mnt \
 --name=ft-triton-bloom \
 --allow-metrics \
 --gpus=2 \
 --replicas=1 \
 --image=ai-studio-registry.cn-beijing.cr.aliyuncs.com/kube-ai/triton_with_ft:22.03-main-2edb257e-transformers \
 --model-repository=/mnt/triton_repo