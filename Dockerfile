FROM pytorch/pytorch:nightly-devel-cuda10.0-cudnn7

LABEL maintainer="Daniel M. Freitas <danielmatte@gmail.com>"

RUN pip install opencv-python moviepy matplotlib scipy

RUN pip install tb-nightly future

RUN pip install --upgrade torch torchvision

CMD ["/bin/bash"]