FROM ubuntu:jammy

ARG GRADLE_VERSION=8.4
ARG MAVEN_VERSION=3.9.5
ARG AWS_CLI_VERSION=2.13.29
ARG AWS_SAM_VERSION=1.99.0

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y build-essential vim unzip curl openjdk-17-jdk software-properties-common groff && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.8 python3-pip && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

ENV GRADLE_HOME=/opt/gradle
RUN curl --fail --location "https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip" -o /tmp/gradle.zip && \
  unzip -q -d "$GRADLE_HOME" "/tmp/gradle.zip" && \
    rm /tmp/gradle.zip
ENV PATH="$PATH":"${GRADLE_HOME}/gradle-${GRADLE_VERSION}/bin"

ENV MAVEN_HOME=/opt/maven
RUN curl --fail --location "https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.zip" -o /tmp/maven.zip && \
    unzip -q -d "$MAVEN_HOME" "/tmp/maven.zip" && \
    rm /tmp/maven.zip
ENV PATH="$PATH":"${MAVEN_HOME}/apache-maven-${MAVEN_VERSION}/bin"

ARG TARGETARCH

WORKDIR /scripts
COPY scripts ./
RUN bash "./install-${TARGETARCH}.sh"
RUN chmod +x /scripts/entrypoint.sh

ENV AWS_DEFAULT_REGION=eu-west-1
ENV SAM_CLI_TELEMETRY=0
WORKDIR /workspace

ENTRYPOINT ["/scripts/entrypoint.sh"]
CMD ["bash"]
