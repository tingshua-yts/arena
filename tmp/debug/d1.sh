./arena serve update tensorflow \
--name=feedback-classification-arena \
--image=harbor.soulapp-inc.cn/soul-ops/tf-serving:1.14.0-gpu \
--gpumemory=5 --replicas 1 --namespace default-group --version=soul --loglevel=debug