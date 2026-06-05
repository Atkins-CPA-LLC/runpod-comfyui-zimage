# Deployment Notes

This repository builds a RunPod Serverless ComfyUI worker image for Z-Image
Turbo. The current Dockerfile starts from `runpod/worker-comfyui:5.7.1-base`
and installs:

- `comfyui-z-image` or the `ComfyUI-Z-Image-Turbo` custom node fallback.
- Z-Image Turbo diffusion model: `z_image_turbo_bf16.safetensors`.
- Qwen text encoder: `qwen_3_4b.safetensors`.
- VAE: `ae.safetensors`.
- ZiT LoRA loader custom node.
- Additional LoRA assets downloaded during image build.

## Operational Notes

- Deployment is expected to run through RunPod GitHub Integration.
- Workflow JSON should reference the model, text encoder, and VAE names listed in `README.md`.
- Keep model filenames aligned between `Dockerfile`, `README.md`, and any workflow examples.
- Treat model download URLs, private model access, and API tokens as deployment-sensitive values.

## Change Policy

Documentation maintenance may update `README.md` and `docs/**` only. Changes to
the Dockerfile, model downloads, runtime behavior, credentials, package setup, or
RunPod build configuration require a separate reviewed code change.
