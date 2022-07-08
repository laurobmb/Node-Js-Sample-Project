FROM quay.io/lagomes/nodejs-14:1-79
WORKDIR /usr/src/app
COPY [ "server.js","index.html","package.json","./" ]

RUN mkdir /tmp/data && \
    npm install

ONBUILD COPY src/ .
ADD img/openshift.jpg ./img/openshift.jpg
VOLUME [ "/tmp/data/" ]
EXPOSE 8080
USER 1001
CMD [ "npm", "start" ]
