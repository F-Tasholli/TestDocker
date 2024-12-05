FROM centos:centos6

MAINTAINER contact@btreepress.com

# Enable EPEL for Node.js
RUN rpm -Uvh https://archives.fedoraproject.org/pub/archive/epel/6/i386/epel-release-6-8.noarch.rpm

# Install Node...
RUN yum install -y npm

# Copy app to /src
COPY . /src

# Install app and dependencies into /src
RUN cd /src; npm install

EXPOSE 8080

CMD cd /src && node ./app.js
