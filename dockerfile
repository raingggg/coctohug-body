# set ubuntu release version
ARG UBUNTU_VER="hirsute"

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
		python3.9-distutils \
		python3.9-venv \
		python3-dev \
		python3-pip \
		python-is-python3 \
		sqlite3 \
		nodejs \
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
		g++ \
	\
# cleanup apt cache
	\
	&& rm -rf \
		/tmp/* \
		/var/lib/apt/lists/* \
		/var/tmp/*

WORKDIR /chia-blockchain
ENTRYPOINT ["bash", "./entrypoint.sh"]