# hadolint ignore=DL3006
FROM openjdk:11.0.4-jre-slim-buster as build
ARG RELEASE_URL=https://api.github.com/repos/checkstyle/checkstyle/releases/latest
SHELL ["/bin/bash","-o", "pipefail","-c"]

# hadolint ignore=DL3008
RUN apt-get update && apt-get install -yq curl jq --no-install-recommends && rm -rf /var/lib/apt/lists/*
#RUN apk add --no-cache curl jq
#RUN curl $RELEASE_URL | jq ."assets[] | .browser_download_url" | xargs curl -L -o /opt/checkstyle.jar

COPY execute_checkstyle.sh /bin/checkstyle

#FROM openjdk:11.0.4-jre-slim-buster
WORKDIR /opt
#COPY --from=build checkstyle.jar checkstyle.jar
ENTRYPOINT ["checkstyle"]
