./arena submit etjob \
    --name=elastic-training \
    --gpus=1 \
    --workers=3 \
    --max-workers=9 \
    --min-workers=1 \
    --image=registry.cn-hangzhou.aliyuncs.com/ai-samples/horovod:0.20.0-tf2.3.0-torch1.6.0-mxnet1.6.0.post0-py3.7-cuda10.1 \
    --working-dir=/examples \
    "horovodrun
    -np \$((\${workers}*\${gpus}))
    --min-np \$((\${minWorkers}*\${gpus}))
    --max-np \$((\${maxWorkers}*\${gpus}))
    --host-discovery-script /etc/edl/discover_hosts.sh
    python /examples/elastic/tensorflow2_mnist_elastic.py
    "