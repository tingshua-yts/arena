arena serve custom \
--namespace=default \
--config=/Users/tingshuai.yts/.kube/config \
--loglevel=info\
 --arena-namespace=arena-system \
 --name=custom-serving-test \
 --version=alpha --gpus=1 --replicas=1 \
 --temp-dir=empty-0:$(ARENA_POD_NAMESPACE)/$(ARENA_POD_NAME) \
 --temp-dir-subpath-expr=empty-0:/opt/logs \
 --restful-port=5000 --image=happy365/fast-style-transfer:latest python app.py