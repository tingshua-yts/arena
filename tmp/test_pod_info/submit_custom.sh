./arena serve custom \
    --name=fast-style-transfer \
    --gpus=1 \
    --version=alpha \
    --replicas=1 \
    --restful-port=5000 \
    --image=happy365/fast-style-transfer:latest \
    "python app.py"
