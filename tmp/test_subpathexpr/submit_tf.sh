./arena serve tensorflow \
  --namespace=default-group \
  --name=mymnist1 \
  --model-name=mnist1  \
  --gpus=1  \
  --data=tfserve-oss-pvc:/tfmodel \
  --data-subpath-expr='tfserve-oss-pvc:$(ARENA_POD_NAMESPACE)/$(ARENA_POD_NAME)' \
  --image=tensorflow/serving:latest-gpu \
  --temp-dir="empty-0:/opt/logs" \
  --temp-dir-subpath-expr='empty-0:$(ARENA_POD_NAMESPACE)/$(ARENA_POD_NAME)' \
  --model-path=/tfmodel/test_arena/tfserve/mnist/ \
  --version-policy=specific:1

