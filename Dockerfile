FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y \
    && apt install -y --no-install-recommends software-properties-common \
    build-essential curl git python2 python2-dev ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py \
    && python2 get-pip.py

WORKDIR /usr/src/app/

COPY . .

RUN python2 -m pip install --no-cache-dir -r requirements.txt

CMD ["python2 webserver.py 8080"]