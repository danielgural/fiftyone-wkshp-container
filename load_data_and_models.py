import fiftyone as fo
import fiftyone.zoo as foz

quickstart_data = foz.load_zoo_dataset("quickstart")
caltech101_dataset = foz.load_zoo_dataset("caltech101")

# Ucomment these lines if you want the datasets to already be loaded into the mongo instance
# quickstart_data.persistent = True
# caltech101_dataset.persistent = True

modelo = foz.load_zoo_model("open-clip-torch")
modelr = foz.load_zoo_model("retinanet-resnet50-fpn-coco-torch")
modely = foz.load_zoo_model("yolo11s-coco-torch")
modelresx = foz.load_zoo_model("resnext50-32x4d-imagenet-torch")
modelresnet = foz.load_zoo_model("resnet50-imagenet-torch")

