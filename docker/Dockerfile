FROM ubuntu:18.04
LABEL maintainer="hyoungseok.k@gmail.com"

ARG PYTHON_VER=3.7.9
RUN apt-get update -y
RUN apt-get install -y \
    git make build-essential \
    libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev \
    curl wget vim

WORKDIR ${HOME}

ENV PYENV_ROOT ${HOME}/.pyenv
ENV PATH ${PYENV_ROOT}/shims:${PYENV_ROOT}/bin:${PATH}
RUN git clone https://github.com/pyenv/pyenv.git .pyenv

RUN pyenv install ${PYTHON_VER}
RUN pyenv global ${PYTHON_VER}
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

RUN echo 'export PYENV_ROOT="${PYENV_ROOT}"' >> ~/.bashrc
RUN echo 'export PATH="${PYENV_ROOT}/bin:${PATH}"' >> ~/.bashrc
RUN echo 'eval "$(pyenv init -)"' >> ~/.bashrc
