FROM ubuntu:22.04
RUN apt-get update && apt-get -y install libmicrohttpd12 libuv1

# docker image build -f ubuntu2204.dockerfile -t sam-aitc/ubuntu2204 .
