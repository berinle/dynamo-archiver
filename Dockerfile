FROM centos:centos6

# Enable EPEL for Node.js
RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
# Install Node.js and npm
RUN yum install -y npm git
# clone dynamo archiver project
RUN mkdir -p /opt/app && cd /opt/app && git clone https://github.com/yegor256/dynamo-archive.git

#ADD package.json /tmp/package.json
ADD https://raw.githubusercontent.com/yegor256/dynamo-archive/master/package.json /tmp/package.json
RUN cd /tmp && npm install
#RUN cp -a /tmp/node_modules /opt/app
RUN cp -a /tmp/node_modules /opt/app/dynamo-archive

VOLUME /dynamodata

WORKDIR /opt/app/dynamo-archive
ADD . /opt/app/dynamo-archive

CMD ["bash"]
