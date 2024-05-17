FROM nvidia/cuda:12.4.1-base-ubuntu20.04

WORKDIR /app

RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN pip install jupyterlab

RUN pip install bitsandbytes==0.42.0 peft==0.8.2 trl==0.7.10 \
    accelerate==0.27.1 datasets==2.17.0 transformers==4.38.1 torch

EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]