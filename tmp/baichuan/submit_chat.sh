arena serve custom \
    --label="deploy_version=v1" \
    --namespace=default-group \
    --gpus=2 \
    --name=baichuan-chat \
    --version=alpha \
    --replicas=1 \
    --restful-port=8501 \
    --data=baichuan-pvc:/mnt \
    --image=ai-studio-registry.cn-beijing.cr.aliyuncs.com/kube-ai/baichuan_chat:0.0.1 \
    "streamlit run /mnt/project/Baichuan-13B/web_demo.py"
