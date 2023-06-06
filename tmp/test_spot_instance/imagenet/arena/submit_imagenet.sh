set -x
set -e
./arena delete imagenet-resnet50-2 -n default-group
sleep 3
./arena submit etjob \
    --namespace=default-group \
    --name=imagenet-resnet50-2 \
    --gpus=1 \
    --memory=64Gi \
    --cpu=16 \
    --workers=3 \
    --max-workers=128 \
    --min-workers=1 \
    --image=ai-studio-registry.cn-beijing.cr.aliyuncs.com/kube-ai/horovod:0.26 \
    --working-dir=/mnt \
    --data=imagenet-pvc:/mnt \
    "horovodrun --log-level DEBUG --verbose
    -np \$((\${workers}*\${gpus}))
    --min-np \$((\${minWorkers}*\${gpus}))
    --max-np \$((\${maxWorkers}*\${gpus}))
    --host-discovery-script /etc/edl/discover_hosts.sh
    python /mnt/example/imagenet/pytorch_imagenet_resnet50_elastic.py --train-dir=/mnt/data/imageNet/ILSVRC/Data/CLS-LOC/train --val-dir=/mnt/data/imageNet/ILSVRC/Data/CLS-LOC/val
    "