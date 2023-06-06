arena serve triton \
 --namespace=default-group \
 --data=bloom-pvc:/mnt \
 --name=bloom-triton \
 --allow-metrics \
 --gpus=2 \
 --replicas=1 \
 --image=ai-studio-registry.cn-beijing.cr.aliyuncs.com/kube-ai/triton_with_ft:22.03-main-2edb257e-transformers\
 --model-repository=/mnt/project/fastertransformer_backend/demo/bloom-560m/model_repo
