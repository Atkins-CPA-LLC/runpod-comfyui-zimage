# RunPod ComfyUI Z-Image Turbo

Custom ComfyUI worker for RunPod Serverless with Z-Image Turbo model.

## What's included

- **Base**: `runpod/worker-comfyui:5.7.1-base` (clean ComfyUI install)
- **Model**: Z-Image Turbo (6B parameter, bf16)
- **Text Encoder**: Qwen 3 4B
- **VAE**: ae.safetensors

## Deployment

Deploy via RunPod GitHub Integration — RunPod builds the image automatically.

## Usage

Send ComfyUI workflow JSON via the RunPod serverless API. Z-Image Turbo uses:
- `UNETLoader` or `Load Diffusion Model` node → `z_image_turbo_bf16.safetensors`
- `CLIPLoader` → `qwen_3_4b.safetensors`  
- `VAELoader` → `ae.safetensors`
- 8 steps, CFG 1.0, euler sampler
