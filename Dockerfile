FROM python:3.10-slim

# os patches
RUN apt-get update && apt-get -y upgrade \
    # for gh-actions path-filter
    && apt-get -y install git \
    && rm -rf /var/lib/apt/lists/*

# install python requirements
COPY requirements.txt .
COPY tests/requirements-test.txt .
RUN pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir -r requirements.txt \
    && pip3 install --no-cache-dir -r requirements-test.txt
