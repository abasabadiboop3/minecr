FROM alpine:latest AS builder
RUN apk add --no-cache git build-base
RUN git clone https://github.com/rofl0r/microsocks.git /src \
    && cd /src \
    && make

FROM alpine:latest
COPY --from=builder /src/microsocks /usr/local/bin/microsocks
EXPOSE 1080
CMD ["microsocks", "-i", "0.0.0.0", "-p", "1080"]
