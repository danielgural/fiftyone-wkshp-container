# https://github.com/microsoft/dstoolkit-devcontainers/blob/main/src/sample_pytorch_gpu_project/.devcontainer/Dockerfile
# https://github.com/voxel51/fiftyone/blob/develop/Dockerfile

# https://docs.github.com/en/codespaces/developing-in-a-codespace/getting-started-with-github-codespaces-for-machine-learning

FROM voxel51/fiftyone
EXPOSE 5151

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
     && apt-get -y install --no-install-recommends  \
      nano \
    && apt-get clean && \
       rm -rf /var/lib/apt/lists/*

RUN pip --no-cache-dir install -q -U pip setuptools wheel \
    && pip wheel \
        torch \
        pycocotools \
        shapely \
        rasterio \
        InstructorEmbedding \
        #   pydicom: DICOM images


