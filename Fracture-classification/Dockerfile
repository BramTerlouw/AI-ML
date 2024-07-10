# Use the NVIDIA CUDA base image
FROM nvidia/cuda:12.4.1-base-ubuntu20.04

# Install essential packages
RUN apt update
RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update && \
    apt-get install -y curl git openssh-server python3-pip


# Update package lists and install Python 3.9
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y python3.9 python3.9-dev python3.9-distutils && \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add Python 3.9 to the PATH
ENV PATH="/usr/bin/python3.9:${PATH}"

# Set the working directory in the container
WORKDIR /app

RUN python3 -m pip install \
    jupyterlab==3.6 \
    notebook==6.5 \
    tensorflow==2.15 \
    tensorboard==2.15 \
    boto3==1.34 \
    kafka-python==2.0 \
    kfp==2.5 \
    matplotlib==3.8 \
    numpy==1.26 \
    pandas==2.2 \
    scikit-learn==1.4 \
    scipy==1.12 \
    odh-elyra==3.16 \
    pymongo==4.6 \
    pyodbc==5.1 \
    codeflare-sdk==0.16 \
    skl2onnx \
    psycopg==3.1 \
    mysql-connector-python==8.3 \

EXPOSE 8888

CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
