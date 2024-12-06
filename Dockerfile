FROM quay.io/centos/centos:stream8

LABEL maintainer="f.tasholli@contrader.group"

RUN echo -e "[BaseOS]\n\
name=CentOS-Stream-8 - BaseOS\n\
baseurl=http://mirror.centos.org/centos/8-stream/BaseOS/x86_64/os/\n\
enabled=1\n\
gpgcheck=0" > /etc/yum.repos.d/CentOS-Stream.repo && \
    echo -e "[AppStream]\n\
name=CentOS-Stream-8 - AppStream\n\
baseurl=http://mirror.centos.org/centos/8-stream/AppStream/x86_64/os/\n\
enabled=1\n\
gpgcheck=0" >> /etc/yum.repos.d/CentOS-Stream.repo && \
    dnf update -y && \
    dnf install -y nodejs npm && \
    dnf clean all

WORKDIR /src
COPY . .
RUN npm install

EXPOSE 8080
CMD ["node", "app.js"]
