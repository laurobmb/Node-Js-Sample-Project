FROM openshift/nodejs
WORKDIR /opt/app-root/src
USER 1001
COPY [ "server.js","index.html","package.json","./" ]
RUN mkdir /tmp/data
RUN npm install
ONBUILD COPY src/ .
ADD img/openshift.jpg ./img/openshift.jpg
VOLUME [ "data/" ]
EXPOSE 8080
CMD [ "npm", "start" ]
