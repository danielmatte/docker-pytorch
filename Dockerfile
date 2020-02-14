FROM pytorch/pytorch:nightly-devel-cuda10.0-cudnn7

LABEL maintainer="Daniel M. Freitas <danielmatte@gmail.com>"

RUN apt-get update && apt-get install -y ffmpeg

RUN pip install opencv-python moviepy matplotlib scipy pandas

RUN pip install tb-nightly future

RUN pip install --upgrade torch torchvision

RUN pip install natsort

CMD ["/bin/bash"]
