# Use an official Python runtime as a base image
FROM python:3.9-slim

# Set environment variables to prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive
ENV PIP_NO_CACHE_DIR=1
ENV PYTHONPATH=/LMRL-Gym

# Set the working directory inside the container
WORKDIR /

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Clone LMRL-Gym
RUN git clone https://github.com/meadowlark-bradsher/LMRL-Gym.git

# Install LMRL-Gym dependencies
WORKDIR /LMRL-Gym
RUN python -m pip install --upgrade pip && \
    pip install -r requirements.txt && \
    pip install --upgrade "jax[cuda]" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html \
     --no-cache-dir

# Clone and install JAXSeq
RUN git clone https://github.com/meadowlark-bradsher/JAXSeq.git
WORKDIR /LMRL-Gym/JAXSeq
RUN python -m pip install -e .

# Download Twenty Questions data
WORKDIR /
RUN wget https://rail.eecs.berkeley.edu/datasets/rl-llm-bench-dataset/twenty-questions/train.json && \
    wget https://rail.eecs.berkeley.edu/datasets/rl-llm-bench-dataset/twenty-questions/eval.json

# Install LMRL-Gym in editable mode
WORKDIR /LMRL-Gym
RUN pip install -e .

# Create and populate t5_oracle directory
WORKDIR /
RUN mkdir t5_oracle
WORKDIR /t5_oracle
RUN wget https://rail.eecs.berkeley.edu/datasets/rl-llm-bench-dataset/twenty-questions/simulator/model/config.json && \
    wget https://rail.eecs.berkeley.edu/datasets/rl-llm-bench-dataset/twenty-questions/simulator/model/params.msgpack

WORKDIR /LMRL-Gym

# The final training command (and any other commands you want to run) are best handled
# in a separate script (train.sh), which we'll create below.  This keeps the
# Dockerfile cleaner.  We'll add a CMD to execute it by default.
COPY train.sh /run.sh
RUN chmod +x /train.sh

CMD ["/run.sh"]