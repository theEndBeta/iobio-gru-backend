FROM ubuntu:20.04

RUN useradd -ms /bin/bash iobio
RUN echo "iobio ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN apt-get update && \
	apt-get install -y \
		build-essential \
		libssl-dev \
		uuid-dev \
		wget \
		sudo

RUN mkdir /app && chown -R iobio:iobio /app

WORKDIR /app
USER iobio

COPY ./install_go.sh .
COPY ./install_singularity.sh .

RUN sh install_go.sh
RUN sh install_singularity.sh

COPY ./ .

ENTRYPOINT ["sh", "run_local.sh"]
