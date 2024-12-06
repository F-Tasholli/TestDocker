FROM quay.io/centos/centos:stream8

LABEL maintainer="f.tasholli@contrader.group"

FROM quay.io/centos/centos:stream9
RUN dnf update -y && \
    dnf install -y nodejs npm && \
    dnf clean all


WORKDIR /src
COPY . .
RUN npm install

EXPOSE 8080
CMD ["node", "app.js"]
