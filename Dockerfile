FROM ubuntu

EXPOSE	25/tcp
EXPOSE	110/tcp
EXPOSE	143/tcp
EXPOSE	5272/tcp

VOLUME	/opt/Xeams

RUN	apt update && \
	apt install -y default-jre-headless

RUN	apt install -y wget

WORKDIR	/opt

RUN	wget https://www.xeams.com/files/XeamsLinux64.tar && \
	tar -xvf XeamsLinux64.tar

COPY	--chmod=700 docker-install.sh .
COPY	--chmod=700 docker-run.sh .

CMD	./docker-run.sh

