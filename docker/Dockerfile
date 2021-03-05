ARG UBUNTU_VERSION=18.04
ARG BASE_IMAGE=nvidia/cuda:11.2.1-cudnn8-runtime-ubuntu

FROM ${BASE_IMAGE}${UBUNTU_VERSION} as base
ARG PYTHON_VERSION=3.7.9

ENV USER user
ENV UID 1000
ENV HOME /home/${USER}

RUN apt-get update && apt-get install -y \
    python-pip \
    curl \
    wget \
    vim \
    sudo \
    zsh \
    apt-utils \
    make \
    build-essential \
    git 
    
# Setting user
RUN adduser --disabled-password \
    --gecos "Default user" \
    --uid ${UID} \
    ${USER}

RUN adduser ${USER} sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER ${USER}
WORKDIR ${HOME}/workspace

RUN curl https://pyenv.run | bash
ENV PYENV_ROOT ${HOME}/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH
RUN git clone https://github.com/pyenv/pyenv.git .pyenv

RUN pyenv install ${PYTHON_VER} && \
    pyenv global ${PYTHON_VER}
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

# Setup pyenv 
RUN echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
RUN echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc 
RUN chown -R ${UID} ${HOME}

USER ${USER}
WORKDIR ${HOME}/workspace