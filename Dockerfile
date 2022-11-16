FROM registry.access.redhat.com/ubi9/nodejs-16:1-75
USER 1001
WORKDIR /opt/app-root/src
COPY [ "server.js","index.html","package.json","./" ]
RUN mkdir /tmp/data
RUN npm install
ONBUILD COPY src/ .
ADD img/openshift.jpg ./img/openshift.jpg
VOLUME [ "data/" ]
EXPOSE 8080
CMD [ "npm", "start" ]
