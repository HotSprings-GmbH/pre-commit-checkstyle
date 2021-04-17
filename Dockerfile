# hadolint ignore=DL3006
FROM alpine as build
ARG LATEST_URL=https://api.github.com/repos/checkstyle/checkstyle/releases/latest
SHELL ["/bin/ash","-o", "pipefail","-c"]

# hadolint ignore=DL3018
RUN apk add --no-cache curl jq
RUN curl $LATEST_URL | jq ."assets[] | .browser_download_url" | xargs curl -L -o checkstyle.jar


FROM gcr.io/distroless/java:11
WORKDIR /opt
COPY --from=build checkstyle.jar checkstyle.jar
ENTRYPOINT ["java", "-jar", "/opt/checkstyle.jar"]
