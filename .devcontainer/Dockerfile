# See https://mcr.microsoft.com/en-us/artifact/mar/devcontainers/python/about
# FROM mcr.microsoft.com/devcontainers/python:1-3.12-bullseye
FROM mcr.microsoft.com/devcontainers/python:3.12-bookworm
ARG USERNAME=vscode

ENV DEBIAN_FRONTEND=noninteractive
RUN sudo apt-get update \
    && sudo apt-get upgrade -y  \
    && sudo apt-get -y install --no-install-recommends build-essential graphviz iputils-ping \
    && sudo apt-get autoremove -y \
    && sudo apt-get clean -y 
RUN sudo apt install -y --no-install-recommends git cmake ninja-build gperf \
    ccache dfu-util device-tree-compiler wget \
    python3-dev python3-pip python3-setuptools python3-tk python3-wheel xz-utils file \
    make gcc gcc-multilib g++-multilib libsdl2-dev libmagic1


RUN sudo apt install -y python3-venv
RUN python3 -m venv ~/zephyrproject/.venv

ENV SHELL=/bin/zsh