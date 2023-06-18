FROM harbor.adamkoro.com/bci/bci-base:15.4 as builder
ENV VERSION=1.8.0
WORKDIR /transmission-web
RUN zypper ref && zypper -n in unzip
RUN curl -LO https://github.com/6c65726f79/Transmissionic/releases/download/v${VERSION}/Transmissionic-webui-v${VERSION}.zip && \
    unzip Transmissionic-webui-v${VERSION}.zip && \
    ls -la && \
    rm -rf Transmissionic-webui-v${VERSION}.zip

FROM harbor.adamkoro.com/docker/linuxserver/transmission:4.0.3
MAINTAINER Adamkoro <akoronics@protonmail.com>
ENV TRANSMISSION_WEB_HOME=/usr/share/transmission/custom-web
COPY --from=builder /transmission-web/web /usr/share/transmission/custom-web
