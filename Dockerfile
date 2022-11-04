FROM node:14-alpine
WORKDIR /opt/app-root/src
COPY [ "server.js","index.html","package.json","./" ]
RUN mkdir /tmp/data
RUN npm install
ONBUILD COPY src/ .
ADD img/openshift.jpg ./img/openshift.jpg
VOLUME [ "data/" ]
EXPOSE 8080
USER 1001
CMD [ "npm", "start" ]
