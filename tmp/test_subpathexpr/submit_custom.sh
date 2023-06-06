./arena serve custom \
    --label="deploy_version=v1" \
    --namespace=default-group \
    --name=fast-style-transfer-5 \
    --version=alpha \
    --replicas=1 \
    --restful-port=5000 \
    --image=python:3.6 \
    "sleep 3000"

