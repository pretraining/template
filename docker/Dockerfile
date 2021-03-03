ARG UBUNTU_VERSION=18.04

FROM nvidia/cuda:11.2.1-cudnn8-runtime-ubuntu${UBUNTU_VERSION} as base
ARG PYTHON_VERSION=3.7.9

ENV USER user
ENV UID 1000
ENV HOME /home/${USER}

RUN apt-get update && apt-get install -y \
    python-pip \
    sudo \
    vim \
    zsh \
    apt-utils \
    make \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    wget \
    curl \
    git \
    libffi-dev \
    liblzma-dev \
    locales \
    g++ \
    libpcre3-dev \
    tar \
    bash \
    rsync \
    gcc \
    libfreetype6-dev \
    libhdf5-serial-dev \
    libpng-dev \
    libzmq3-dev \
    unzip \
    zip \
    pkg-config \
    software-properties-common \
    graphviz \
    eog \
    htop \
    ca-certificates 

# Install OpenJDK-8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean

# Setting user
RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${UID} \
    ${USER}

RUN adduser ${USER} sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers


RUN curl https://pyenv.run | bash
ENV PYENV_ROOT ${HOME}/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
RUN git clone https://github.com/pyenv/pyenv.git .pyenv

RUN pyenv install ${PYTHON_VER} && \
    pyenv global ${PYTHON_VER}

RUN pip install --no-cache-dir --upgrade pip setuptools wheel && \
    pip install --no-cache-dir notebook==5.* pyspark==${SPARK_VER} spylon-kernel==0.4.* && \
    python -m spylon_kernel install --sys-prefix

# Setup pyenv 
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc

USER root
RUN chown -R ${UID} ${HOME}

USER ${USER}
WORKDIR ${HOME}/workspace