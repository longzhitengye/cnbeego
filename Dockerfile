FROM golang:1.15.2-buster
ENV GO111MODULE=on
ENV GOPROXY=https://goproxy.cn
#RUN go env

RUN mkdir -p /go/src/github.com/astaxie
WORKDIR /go/src/github.com/astaxie
RUN git clone  https://github.com/astaxie/beego
WORKDIR /go/src/github.com/astaxie/beego
RUN go install

RUN mkdir -p /go/src/github.com/beego
WORKDIR /go/src/github.com/beego
RUN git clone https://github.com/beego/bee
WORKDIR /go/src/github.com/beego/bee
RUN go install

RUN mkdir -p /go/src/work
WORKDIR /go/src/work
VOLUME /go/src/work
CMD ["go","mod","tidy"]
CMD ["bee","run","-gendoc=true","-downdoc=true"]
