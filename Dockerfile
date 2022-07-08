FROM node
WORKDIR /usr/src/app
COPY [ "server.js","index.html","package.json","./" ]

RUN mkdir data && \
    npm install

ONBUILD COPY src/ .
ADD img/openshift.jpg ./img/openshift.jpg
VOLUME [ "data/" ]
EXPOSE 8080
USER 1001
CMD [ "npm", "start" ]
