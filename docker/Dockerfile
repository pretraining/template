# Copyright The Pretraining team.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Existing images:
# --build-arg UBUNTU_VER=18.04 --build-arg PYTHON_VER=3.7

ARG UBUNTU_VER=18.04
FROM ubuntu:${UBUNTU_VER}

ARG PYTHON_VER=3.8

RUN apt-get update && \
    apt-get install -y --only-upgrade bash && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
    apt-get update && \
    apt-get install -y locales && locale-gen en_US.UTF-8 && locale-gen ko_KR.UTF-8 && \
    apt-get install -y \
        git make build-essential \
        libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev \
        curl wget vim \
    && \
    # Install python
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get install -y \
        python${PYTHON_VER} \
        python${PYTHON_VER}-distutils \
        python${PYTHON_VER}-dev \
    && \
    update-alternatives --install /usr/bin/python python /usr/bin/python${PYTHON_VER} 1 && \
    # Cleaning
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /root/.cache && \
    rm -rf /var/lib/apt/lists/* && \
    wget https://bootstrap.pypa.io/get-pip.py \
    && \
    python get-pip.py && \
    bash -c "python --version"

