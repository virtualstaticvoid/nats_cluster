FROM golang:1.10 as builder

COPY stan_bench.go .

RUN go get github.com/nats-io/go-nats-streaming
RUN go build -o bench stan_bench.go

FROM debian:stretch

COPY --from=builder /go/bench /usr/bin/bench

ENTRYPOINT ["/usr/bin/bench"]
