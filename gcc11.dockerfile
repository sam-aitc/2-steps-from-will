FROM gcc:11
RUN apt-get update && apt-get -y install libuv1-dev libmicrohttpd-dev

# docker image build -f gcc11.dockerfile -t sam-aitc/gcc11 .
