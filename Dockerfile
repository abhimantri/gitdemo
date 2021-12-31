FROM ubuntu@sha256:626ffe58f6e7566e00254b638eb7e0f3b11d4da9675088f4781a50ae288f3322

ARG JAVA_VERSION=8
USER root
RUN apt-get update && apt-get upgrade -y
RUN apt-get install apt-utils curl wget xz-utils openjdk-${JAVA_VERSION}-jdk lsb-release gnupg ca-certificate
RUN export JAVA_HOME=/usr/lib/jvm/java-${JAVA_VERSION}-openjdk-amd64/
RUN export PATH=$JAVA_HOME/bin:$PATH

RUN useradd -m docker && cd /home/docker && chown -R docker:docker ../docker

COPY ./startup.sh startup.sh
RUN chmod 755 startup.sh
expose 80 80
ENTRYPOINT ["./startup.sh"]

