  arena submit pytorch \
    --namespace=default-group \
    --name=pytorch-git \
    --gpus=1 \
    --working-dir=/root \
    --image=registry.cn-beijing.aliyuncs.com/ai-samples/pytorch-with-tensorboard:1.5.1-cuda10.1-cudnn7-runtime \
    --sync-mode=git \
    --sync-source=https://code.aliyun.com/370272561/mnist-pytorch.git \
    --data=bloom7b1-pvc:/mnist_data \
    --tensorboard \
    --logdir=/mnist_data/pytorch_data/logs \
    "run"