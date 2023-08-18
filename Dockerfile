# Transmissionic theme
#FROM harbor.adamkoro.com/bci/bci-base:15.4 as builder
#ENV VERSION=1.8.0
#WORKDIR /transmission-web
#RUN zypper ref && zypper -n in unzip
#RUN curl -LO https://github.com/6c65726f79/Transmissionic/releases/download/v${VERSION}/Transmissionic-webui-v${VERSION}.zip && \
#    unzip Transmissionic-webui-v${VERSION}.zip && \
#    rm -rf Transmissionic-webui-v${VERSION}.zip

# Combustion theme
FROM harbor.adamkoro.com/bci/bci-base:15.5 as builder
WORKDIR /transmission-web
RUN zypper ref && zypper -n in unzip
RUN curl -LO https://github.com/Secretmapper/combustion/archive/release.zip && \
    unzip release.zip && \
    rm -rf release.zip


FROM harbor.adamkoro.com/docker/linuxserver/transmission:4.0.3
ENV TRANSMISSION_WEB_HOME=/usr/share/transmission/custom-web
COPY --from=builder /transmission-web/combustion-release /usr/share/transmission/custom-web
