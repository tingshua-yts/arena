arena submit pytorchjob\
  --gpus=2\
  --image ai-studio-registry-vpc.cn-beijing.cr.aliyuncs.com/kube-ai/fastertransformer:torch-0.0.1\
  --name perf-ft-bloom \
  --workers 1\
  --namespace default-group\
  --data bloom7b1-pvc:/mnt\
  'mpirun --allow-run-as-root -n 2 python /FasterTransformer/examples/pytorch/gpt/bloom_lambada.py \
    --lib-path /FasterTransformer/build/lib/libth_transformer.so \
    --checkpoint-path /mnt/model/bloom-7b1-ft-fp16/2-gpu \
    --batch-size 16 \
    --tokenizer-path /mnt/model/bloom-7b1 \
    --dataset-path /mnt/data/lambada/lambada_test.jsonl \
    --show-progress'
