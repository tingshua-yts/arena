jobname=imagenet-resnet50-small-$RANDOM
./arena delete $jobname -n default-group
./arena submit etjob \
    --selector=instance_type=pay\
    --label=job_name=$jobname \
    --namespace=default-group \
    --name=$jobname \
    --gpus=1 \
    --memory=32Gi \
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
    python /mnt/example/imagenet/pytorch_imagenet_resnet50_elastic.py --epochs=20 --num-workers=16 --train-dir=/mnt/data/imageNet/ILSVRC/Data/CLS-LOC-MINI/train --val-dir=/mnt/data/imageNet/ILSVRC/Data/CLS-LOC-MINI/val --skip-restore --checkpoint-format=./small-checkpoint-{epoch}.pth.tar
    "