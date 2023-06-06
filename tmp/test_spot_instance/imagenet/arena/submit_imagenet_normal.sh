jobname=imagenet-resnet50-normal-$RANDOM
./arena delete $jobname -n default-group
./arena submit etjob \
    --launcher-selector=instance_type=pay-launcher \
    --toleration=exp\
    --selector=instance_type=pay\
    --label=job_name=$jobname \
    --namespace=default-group \
    --name=$jobname \
    --gpus=1 \
    --memory=25Gi \
    --cpu=7 \
    --workers=12 \
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
    python /mnt/example/imagenet/pytorch_imagenet_resnet50_elastic.py --epochs=100 --num-workers=6 --train-dir=/mnt/data/imageNet/ILSVRC/Data/CLS-LOC/train --val-dir=/mnt/data/imageNet/ILSVRC/Data/CLS-LOC/val --skip-restore --checkpoint-format=./small-checkpoint-{epoch}.pth.tar --name="$jobname