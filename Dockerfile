FROM python:3.7
RUN apt update
RUN apt upgrade -y
RUN apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt install nodejs -y

COPY . /app
WORKDIR /app

RUN pip install -e .

WORKDIR /app/src/keras-rl2
RUN pip install .

WORKDIR /app

ENTRYPOINT [ "bash", "setup_docker.sh" ]