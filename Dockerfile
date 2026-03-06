# Z-Image Turbo on RunPod Serverless
# Following: https://github.com/runpod-workers/worker-comfyui/blob/main/docs/customization.md
FROM runpod/worker-comfyui:5.7.1-base

# Install Z-Image custom nodes (chat template, multi-turn, style presets)
RUN comfy-node-install comfyui-z-image || \
    (cd /comfyui/custom_nodes && \
     git clone https://github.com/tpc2233/ComfyUI-Z-Image-Turbo.git && \
     cd ComfyUI-Z-Image-Turbo && \
     if [ -f requirements.txt ]; then pip install -r requirements.txt; fi)

# Download Z-Image Turbo models using comfy model download (per RunPod docs)
RUN comfy model download \
    --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/diffusion_models/z_image_turbo_bf16.safetensors \
    --relative-path models/diffusion_models \
    --filename z_image_turbo_bf16.safetensors

RUN comfy model download \
    --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/text_encoders/qwen_3_4b.safetensors \
    --relative-path models/text_encoders \
    --filename qwen_3_4b.safetensors

RUN comfy model download \
    --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/vae/ae.safetensors \
    --relative-path models/vae \
    --filename ae.safetensors

# Install ZiT LoRA Loader (Z-Image needs special loader, standard one silently drops keys)
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/holchan/Comfyui-ZiT-Lora-loader.git && \
    cd Comfyui-ZiT-Lora-loader && \
    if [ -f requirements.txt ]; then pip install -r requirements.txt; fi

# Download Z-Image LoRAs from CivitAI
RUN curl -L -H "Authorization: Bearer 8803afcb6bbea90483b630868ca427a5" \
    -o /comfyui/models/loras/RealisticSnapshot_v5.safetensors \
    "https://civitai.com/api/download/models/2617751"

RUN curl -L -H "Authorization: Bearer 8803afcb6bbea90483b630868ca427a5" \
    -o /comfyui/models/loras/TeeKaysTittyTime_AQueensTits_V1-2_ZIT.safetensors \
    "https://civitai.com/api/download/models/2491378"
