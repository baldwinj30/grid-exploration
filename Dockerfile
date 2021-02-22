FROM pytorch/pytorch:1.7.1-cuda11.0-cudnn8-runtime AS base

RUN apt-get update && apt-get install -y \
    openssh-client \
    git

RUN pip install -U pip setuptools

COPY requirements.txt .

RUN pip install -r requirements.txt

ARG username=vision
RUN useradd -m $username
USER $username
