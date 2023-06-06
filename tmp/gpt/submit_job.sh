arena submit etjob \
    --name=gpt-neox-demo \
    --namespace=default-group \
    --gpus=1 \
    --workers=4 \
    --image=registry-vpc.cn-beijing.aliyuncs.com/yulin-test/deepspeed:yulin-gpt \
    --image-pull-secret yulin-reg \
    --data=gpt3-pvc:/root/code \
    --data=imagenet-pvc:/root/data \
    "cd /root/code/project/gpt-neox && python ./deepy.py train.py -d configs small_pp.yml local_setup.yml"