FROM golang

MAINTAINER Knut Ahlers <knut@luzifer.io>

ENV VERSION master
ENV GOPATH /go:/go/src/github.com/thoas/picfit/vendor
ENV GO15VENDOREXPERIMENT 1

RUN mkdir -p /go/src/github.com/thoas \
 && git clone https://github.com/thoas/picfit.git /go/src/github.com/thoas/picfit

WORKDIR /go/src/github.com/thoas/picfit

RUN git checkout ${VERSION} \
 && go install

VOLUME ["/config"]
EXPOSE 3001/tcp

ENTRYPOINT ["/go/bin/picfit"]
CMD ["-c", "/config/config.json"]

