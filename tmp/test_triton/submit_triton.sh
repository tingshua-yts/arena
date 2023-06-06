./arena serve triton \
 --namespace=default-group \
 --version=vvvv \
 --data=fashion-pvc:/models \
 --data=tfserve-oss-pvc:/models2 \
 --data-subpath-expr='tfserve-oss-pvc:$(ARENA_POD_NAMESPACE)/$(ARENA_POD_NAME)' \
 --name=bert-triton \
 --allow-metrics \
 --gpus=1 \
 --replicas=1 \
 --image=ai-studio-registry.cn-beijing.cr.aliyuncs.com/kube-ai/triton:20.12-py3 \
 --model-repository=/models/triton_example/model_simple_string

#  --temp-dir="empty-0:/opt/logs" \
# --temp-dir-subpath-expr='empty-0:$(ARENA_POD_NAMESPACE)/$(ARENA_POD_NAME)' \