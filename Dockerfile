FROM ubuntu:jammy

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y build-essential vim unzip curl openjdk-17-jdk software-properties-common maven && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.8 python3-pip && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

ARG GRADLE_VERSION=8.4
ENV GRADLE_HOME=/opt/gradle
RUN curl --fail --location "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" -o /tmp/gradle.zip && \
  unzip -q -d "$GRADLE_HOME" "/tmp/gradle.zip" && \
    rm /tmp/gradle.zip
ENV PATH="$PATH":"${GRADLE_HOME}/gradle-${GRADLE_VERSION}/bin"

ARG TARGETARCH

WORKDIR /install
COPY scripts ./
RUN bash "./install-${TARGETARCH}.sh"
RUN rm -rf /install

ENV DEFAULT_AWS_REGION=eu-west-1
WORKDIR /workspace
