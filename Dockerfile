FROM golang:1.13

ENV GOBUSTER_VERSION v3.0.1

RUN set -x; mkdir -p /usr/share/wordlists && cd /usr/share/ && \
  git init wordlists && cd wordlists && \
  git remote add origin https://github.com/danielmiessler/SecLists.git && \
  git config core.sparsecheckout true && echo "Discovery/*" >> .git/info/sparse-checkout && \
  git pull --depth=1 origin master

WORKDIR /go/src/gobuster
RUN git clone https://github.com/OJ/gobuster.git .
RUN git checkout $GOBUSTER_VERSION
RUN go get ./... && go build && go install ./...
ENTRYPOINT ["/go/bin/gobuster"]
