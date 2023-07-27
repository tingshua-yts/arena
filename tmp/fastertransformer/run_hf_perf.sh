arena submit pytorchjob\
  --gpus=2\
  --image ai-studio-registry.cn-beijing.cr.aliyuncs.com/kube-ai/fastertransformer:torch-0.0.1\
  --name perf-hf-bloom \
  --workers 1\
  --namespace default-group\
  --data bloom7b1-pvc:/mnt\
  'python /FasterTransformer/examples/pytorch/gpt/bloom_lambada.py \
    --tokenizer-path /mnt/model/bloom-7b1 \
    --dataset-path /mnt/data/lambada/lambada_test.jsonl \
    --batch-size 16 \
    --test-hf \
    --show-progress'
