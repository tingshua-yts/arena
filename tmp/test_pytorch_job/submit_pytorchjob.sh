./arena submit pytorchjob\
 --gpus=1\
  --image registry.cn-beijing.aliyuncs.com/ccnl-image-bj2/ali-gts-core:v1.0.1\
  --logdir /data/logs\
  --name 20224203024214\
  --sync-mode git\
  --sync-source http://172.16.0.141:30800/cognitive-computing/gts-tapt.git\
  --workers 1\
  --working-dir /root\
  --namespace default-group\
  --env GIT_SYNC_USERNAME=xx\
  --env GIT_SYNC_PASSWORD=xxx\
  --env GIT_SYNC_BRANCH=\
  --data 'ccnl-gts-test-pvc:/root/data' \
    pip install /root/data/static/models/gts_student_lib-0.0.1.tar.gz; python /root/code/gts_student/main.py --gts_input_path /root/data/123456/data --gts_pretrained_model_path /root/data/static/models/ --gts_gpu_id 0 --gts_output_dir /root/data/123456/gts_output --gts_train_level 1 --task
