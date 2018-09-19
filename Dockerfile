FROM golang:1.8

WORKDIR /go/src/gobuster
RUN git clone https://github.com/OJ/gobuster.git .
RUN go get && go build && go install
ENTRYPOINT ["/go/bin/gobuster"]
