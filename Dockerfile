FROM quay.io/centos/centos:stream8

LABEL maintainer="f.tasholli@contrader.group"

RUN dnf update -y --setopt=baseurl=http://mirror.centos.org/centos/8-stream/BaseOS/x86_64/os/ && \
    dnf install -y nodejs npm && \
    dnf clean all

WORKDIR /src
COPY . .
RUN npm install

EXPOSE 8080
CMD ["node", "app.js"]
