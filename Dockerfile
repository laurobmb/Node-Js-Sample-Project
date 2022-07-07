FROM node
WORKDIR /usr/src/app
COPY [ "server.js","index.html","package.json","./" ]

RUN npm install ;\
    mkdir data
ONBUILD COPY src/ .
ADD img/openshift.jpg ./img/openshift.jpg
VOLUME [ "data/" ]
EXPOSE 8080
CMD [ "npm", "start" ]
