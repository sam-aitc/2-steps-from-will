FROM samaitc/gcc11 AS builder
WORKDIR /demo/bin
WORKDIR /demo/src
COPY main.c ./libmu/src/mu.c ./libmu/src/mu.h /demo/src/
RUN gcc -Wno-incompatible-pointer-types -o ../bin/demoServer main.c mu.c -luv -lmicrohttpd

FROM samaitc/ubuntu2204
COPY --from=builder /demo/bin/demoServer /demo/

EXPOSE 3000

# ENTRYPOINT [  ]
CMD [ "/demo/demoServer" ]

# docker image build -f demo001.dockerfile -t samaitc/demo001 .
