arena submit pytorchjob\
  --gpus=1\
  --image ai-studio-registry-vpc.cn-beijing.cr.aliyuncs.com/kube-ai/fastertransformer:torch-0.0.1\
  --name convert-bloom\
  --workers 1\
  --namespace default-group\
  --data bloom7b1-pvc:/mnt\
  'python  /FasterTransformer/examples/pytorch/gpt/utils/huggingface_bloom_convert.py -i /mnt/model/bloom-7b1 -o /mnt/model/bloom-7b1-ft-fp16 -tp 2  -dt fp16 -p 64 -v'
