# Z-Image Turbo on RunPod Serverless
# Following: https://github.com/runpod-workers/worker-comfyui/blob/main/docs/customization.md
FROM runpod/worker-comfyui:5.7.1-base

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
