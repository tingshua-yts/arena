set -x
set -e
    ./arena submit tfjob --name=tf-dist2         \
              --namespace=default-group \
              --working-dir=/root \
              --gpus=1              \
              --workers=2              \
              --worker-image=tensorflow/tensorflow:1.5.0-devel-gpu  \
              --worker-cpu=250m --worker-cpu-limit=500m \
              --worker-memory=1Gi --worker-memory-limit=2Gi \
              --sync-mode=git \
              --sync-source=https://code.aliyun.com/xiaozhou/tensorflow-sample-code.git \
              --ps=1              \
              --ps-cpu=250m --ps-cpu-limit=500m \
              --ps-memory='1Gi' \
              --ps-memory-limit='2Gi' \
              --ps-image="tensorflow/tensorflow:1.5.0-devel"\
              --data="fashion-pvc:/mnist_data "     --logdir="/mnist_data/tf_data/logs" \
              "python code/tensorflow-sample-code/tfjob/docker/mnist/main.py --log_dir /mnist_data/tf_data/logs  --data_dir /mnist_data/test_data"