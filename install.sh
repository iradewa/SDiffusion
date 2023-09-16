pip install -q xformers==0.0.20 triton==2.0.0 -U
if [ $4 == True ]; then
  pip install -U openmim
  mim install mmcv>=2.0.0 -f https://download.openmmlab.com/mmcv/dist/cu118/torch2.0.0/index.html
  mim install mmdet>=3.0.0
fi

git clone -b $2 https://github.com/AUTOMATIC1111/stable-diffusion-webui /content/$1
if [ $3 == True ]; then
  git clone https://github.com/Mikubill/sd-webui-controlnet /content/$1/extensions/controlnet
fi
if [ $4 == True ]; then
  git clone -b mmdet3 https://github.com/ninjaneural/ddetailer /content/$1/extensions/ddetailer
fi
if [ $5 == True ]; then
  git clone https://github.com/Bing-su/adetailer /content/$1/extensions/adetailer
fi
if [ $6 == True ]; then
  git clone https://github.com/ninjaneural/segment-anything /content/$1/extensions/segment-anything
fi

git clone https://github.com/adieyal/sd-dynamic-prompts /content/$1/extensions/sd-dynamic-prompts
git clone https://github.com/DominikDoom/a1111-sd-webui-tagcomplete /content/$1/extensions/a1111-sd-webui-tagcomplete
git clone https://github.com/Coyote-A/ultimate-upscale-for-automatic1111 /content/$1/extensions/ultimate-upscale-for-automatic1111
git clone https://github.com/KohakuBlueleaf/a1111-sd-webui-lycoris /content/$1/extensions/a1111-sd-webui-lycoris
git clone https://github.com/alemelis/sd-webui-ar /content/$1/extensions/sd-webui-ar
git clone https://github.com/neuralninja22/images-browser /content/$1/extensions/images-browser
git clone https://github.com/kohya-ss/sd-webui-additional-networks /content/$1/extensions/additional-networks
git clone https://github.com/picobyte/stable-diffusion-webui-wd14-tagger /content/$1/extensions/wd14-tagger
git clone https://github.com/ninjaneural/video-util /content/$1/extensions/video-util

git clone https://github.com/fkunn1326/openpose-editor /content/$1/extensions/openpose-editor
git clone https://github.com/fishslot/video_loopback_for_webui /content/$1/extensions/video_loopback_for_webui

if [ $7 == True ]; then
  git clone https://github.com/Scholar01/sd-webui-mov2mov /content/$1/extensions/mov2mov
fi

if [ $3 == True ]; then
  aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_openpose_fp16.safetensors -d /content/$1/extensions/controlnet/models -o control_v11p_sd15_openpose_fp16.safetensors
  aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_lineart_fp16.safetensors -d /content/$1/extensions/controlnet/models -o control_v11p_sd15_lineart_fp16.safetensors
  aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_softedge_fp16.safetensors -d /content/$1/extensions/controlnet/models -o control_v11p_sd15_softedge_fp16.safetensors
  aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11f1p_sd15_depth_fp16.safetensors -d /content/$1/extensions/controlnet/models -o control_v11f1p_sd15_depth_fp16.safetensors
  aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_canny_fp16.safetensors -d /content/$1/extensions/controlnet/models -o control_v11p_sd15_canny_fp16.safetensors
  aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_seg_fp16.safetensors -d /content/$1/extensions/controlnet/models -o control_v11p_sd15_seg_fp16.safetensors
  aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15s2_lineart_anime_fp16.safetensors -d /content/$1/extensions/controlnet/models -o control_v11p_sd15s2_lineart_anime_fp16.safetensors
  aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11e_sd15_ip2p_fp16.safetensors -d /content/$1/extensions/controlnet/models -o control_v11e_sd15_ip2p_fp16.safetensors
  aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_inpaint_fp16.safetensors -d /content/$1/extensions/controlnet/models -o control_v11p_sd15_inpaint_fp16.safetensors
  aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11f1e_sd15_tile_fp16.safetensors -d /content/$1/extensions/controlnet/models -o control_v11f1e_sd15_tile_fp16.safetensors
  aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_scribble_fp16.safetensors -d /content/$1/extensions/controlnet/models -o control_v11p_sd15_scribble_fp16.safetensors
  aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/CiaraRowles/TemporalNet/resolve/main/diff_control_sd15_temporalnet_fp16.safetensors -d /content/$1/extensions/controlnet/models -o diff_control_sd15_temporalnet_fp16.safetensors
  aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/CiaraRowles/TemporalNet/resolve/main/cldm_v15.yaml -d /content/$1/extensions/controlnet/models -o diff_control_sd15_temporalnet_fp16.yaml


  aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_mlsd_fp16.safetensors -d /content/$1/extensions/controlnet/models -o control_v11p_sd15_mlsd_fp16.safetensors
  aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_normalbae_fp16.safetensors -d /content/$1/extensions/controlnet/models -o control_v11p_sd15_normalbae_fp16.safetensors
  aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11e_sd15_shuffle_fp16.safetensors -d /content/$1/extensions/controlnet/models -o control_v11e_sd15_shuffle_fp16.safetensors

  aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/TencentARC/T2I-Adapter/resolve/main/models/t2iadapter_style_sd14v1.pth -d /content/$1/extensions/controlnet/models -o t2iadapter_style_sd14v1.pth
  aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/TencentARC/T2I-Adapter/resolve/main/models/t2iadapter_color_sd14v1.pth -d /content/$1/extensions/controlnet/models -o t2iadapter_color_sd14v1.pth
  aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/TencentARC/T2I-Adapter/resolve/main/models/t2iadapter_sketch_sd15v2.pth -d /content/$1/extensions/controlnet/models -o t2iadapter_sketch_sd15v2.pth
  aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/TencentARC/T2I-Adapter/resolve/main/models/t2iadapter_zoedepth_sd15v1.pth -d /content/$1/extensions/controlnet/models -o t2iadapter_zoedepth_sd15v1.pth

  aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/ioclab_sd15_recolor.safetensors -d /content/$1/extensions/controlnet/models -o ioclab_sd15_recolor.safetensors  
  aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/ip-adapter_sd15_plus.pth -d /content/$1/extensions/controlnet/models -o ip-adapter_sd15_plus.pth  
  
fi

if [ $6 == True ]; then
  mkdir /content/$1/models/sam
  aria2c --console-log-level=error -c -x 16 -s 16 -k 1M https://dl.fbaipublicfiles.com/segment_anything/sam_vit_h_4b8939.pth -d /content/$1/models/sam -o sam_vit_h_4b8939.pth
fi

if [ $2 != "v1.6.0" ]; then
  sed -i -e "/from modules import launch_utils/a\import os" /content/$1/launch.py
  sed -i -e "/        prepare_environment()/a\        os.system(f\\\"\"\"sed -i -e \"s/dict()))/dict())).cuda()/g\" /content/$1/repositories/stable-diffusion-stability-ai/ldm/util.py\"\"\")" /content/$1/launch.py
fi
wget https://raw.githubusercontent.com/ninjaneural/webui/master/misc/config.json -O /content/$1/config.json