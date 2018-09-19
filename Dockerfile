FROM golang:1.8

RUN mkdir -p /usr/share/wordlists && cd /usr/share/wordlists && git clone  https://github.com/danielmiessler/SecLists.git .

WORKDIR /go/src/gobuster
RUN git clone https://github.com/OJ/gobuster.git .
RUN go get && go build && go install
ENTRYPOINT ["/go/bin/gobuster"]
