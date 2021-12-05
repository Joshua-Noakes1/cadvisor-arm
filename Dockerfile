# Builder
FROM golang as builder

LABEL org.opencontainers.image.authors="joshua@joshuanoakes.co.uk"

ENV CADVISOR_VERSION "v0.38.8"

RUN apt-get update && apt-get install -y git dmsetup && apt-get clean

RUN git clone --branch ${CADVISOR_VERSION} https://github.com/google/cadvisor.git /go/src/github.com/google/cadvisor

WORKDIR /go/src/github.com/google/cadvisor

RUN make build

# Image for usage
FROM golang

LABEL org.opencontainers.image.authors="joshua@joshuanoakes.co.uk"

COPY --from=builder /go/src/github.com/google/cadvisor/cadvisor /usr/bin/cadvisor

EXPOSE 8080
ENTRYPOINT ["/usr/bin/cadvisor", "-logtostderr"]
