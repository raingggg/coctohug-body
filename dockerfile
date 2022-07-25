# set ubuntu release version
ARG UBUNTU_VER="jammy"

######## packages stage ###########
FROM ubuntu:${UBUNTU_VER}

ARG DEBIAN_FRONTEND=noninteractive

# install build packages
RUN \
	apt-get update \
	&& apt-get install -y \
		acl \
		ansible \
		apt \
		bash \
		bc \
		build-essential \
		ca-certificates \
		curl \
		git \
		jq \
		lsb-release \
		nfs-common \
		openssl \
		python3 \
		python3.10-distutils \
		python3.10-venv \
		python3-dev \
		python3-pip \
		python-is-python3 \
		sqlite3 \
		sudo \
		tar \
		tzdata \
		unzip \
		vim \
		wget \
		cmake \
		rsync \
		iputils-ping \
		libgmp-dev \
		libnuma-dev \
		libsodium-dev \
		g++

RUN curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh \
  && bash nodesource_setup.sh

RUN \
	apt-get update \
	&& apt-get install -y \
    nodejs

RUN rm -rf \
		/tmp/* \
		/var/lib/apt/lists/* \
		/var/tmp/*

ENV NODE_ENV=production

RUN \
	npm install forever -g

WORKDIR /chia-blockchain
ENTRYPOINT ["bash", "./entrypoint.sh"]