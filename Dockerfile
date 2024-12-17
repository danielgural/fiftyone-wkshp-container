# https://github.com/microsoft/dstoolkit-devcontainers/blob/main/src/sample_pytorch_gpu_project/.devcontainer/Dockerfile
# https://github.com/voxel51/fiftyone/blob/develop/Dockerfile

# https://docs.github.com/en/codespaces/developing-in-a-codespace/getting-started-with-github-codespaces-for-machine-learning

FROM voxel51/fiftyone
EXPOSE 5151

USER root

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
     && apt-get -y install --no-install-recommends  \
      nano \
    && apt-get clean && \
       rm -rf /var/lib/apt/lists/*

RUN chmod 744 /opt/.fiftyone-venv/bin/activate && bash /opt/.fiftyone-venv/bin/activate

RUN pip --no-cache-dir install -q -U torch \
        torchvision \
        open_clip_torch \
        pycocotools \
        shapely \
        rasterio \
        ultralytics \
        InstructorEmbedding

COPY load_data_and_models.py /tmp/

RUN python3 /tmp/load_data_and_models.py

# Going to want to run a python script that downloads some zoo data, some zoo models, and then adds them to the database
# this data
# https://docs.voxel51.com/dataset_zoo/datasets.html#dataset-zoo-caltech101
# https://docs.voxel51.com/dataset_zoo/datasets.html#quickstart
# These models
# https://docs.voxel51.com/model_zoo/models.html#open-clip-torch
# https://docs.voxel51.com/model_zoo/models.html#med-sam-2-video-torch
# https://docs.voxel51.com/model_zoo/models.html#retinanet-resnet50-fpn-coco-torch

