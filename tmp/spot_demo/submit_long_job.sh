jobname=imagenet-resnet50-normal-spot-$RANDOM
arena delete $jobname -n default-group
arena submit etjob  --loglevel=debug \
    --spot-instance \
    --max-wait-time=3600 \
    --job-restart-policy=OnFailure \
    --job-backoff-limit=10 \
    --worker-restart-policy=Always \
    --launcher-selector=instance_type=spot-launcher \
    --toleration=exp\
    --selector=instance_type=spot\
    --label=job_name=$jobname \
    --namespace=default-group \
    --name=$jobname \
    --gpus=1 \
    --memory=25Gi \
    --cpu=7 \
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
    python /mnt/example/imagenet/pytorch_imagenet_resnet50_elastic.py  --epochs=100 --num-workers=6 --train-dir=/mnt/data/imageNet/ILSVRC/Data/CLS-LOC-MINI/train --val-dir=/mnt/data/imageNet/ILSVRC/Data/CLS-LOC/val --checkpoint-format=./"$jobname"-checkpoint-{epoch}.pth.tar --name="$jobname