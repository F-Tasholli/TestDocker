FROM centos:stream8

LABEL maintainer="f.tasholli@contrader.group"

RUN dnf update -y && \
    dnf install -y nodejs npm && \
    dnf clean all

WORKDIR /src
COPY . .
RUN npm install

EXPOSE 8080
CMD ["node", "app.js"]
