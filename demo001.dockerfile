FROM samaitc/gcc11 AS builder
WORKDIR /demo/bin
WORKDIR /demo/src
COPY main.c /demo/src/
RUN git clone https://github.com/mattbudish/libmu.git ../libmu && gcc -o ../bin/demoServer main.c ../libmu/src/mu.c -I../libmu/src -luv -lmicrohttpd

FROM samaitc/ubuntu2204
COPY --from=builder /demo/bin/demoServer /demo/

EXPOSE 3000

# ENTRYPOINT [  ]
CMD [ "/demo/demoServer" ]

# docker image build -f demo001.dockerfile -t samaitc/demo001 .
