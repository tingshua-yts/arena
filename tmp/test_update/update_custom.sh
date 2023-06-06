arena serve update custom \
    --label="deploy_version=v3" \
    --namespace=default-group \
    --loglevel=debug \
    --name=fast-style-transfer-5 \
    --version=alpha \
    --replicas=2 \
    --image=python:3.6 \
    "sleep 3000"