FROM golang:1.8

RUN mkdir -p /usr/share/wordlists && cd /usr/share/wordlists && \
  wget https://github.com/danielmiessler/SecLists/archive/master.zip && \
  unzip mater.zip && rm master.zip

WORKDIR /go/src/gobuster
RUN git clone https://github.com/OJ/gobuster.git .
RUN go get && go build && go install
ENTRYPOINT ["/go/bin/gobuster"]
