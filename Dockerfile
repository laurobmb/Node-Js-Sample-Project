FROM node
WORKDIR /usr/src/app
COPY [ "server.js","index.html","package.json","./" ]

RUN npm config set timeout 6000000 &&\
    npm config set cache-min 3600 &&\
    npm config set fetch-timeout 60000 &&\
    npm config rm proxy &&\
    npm config rm https-proxy

RUN npm install ;\
    mkdir data
ONBUILD COPY src/ .
ADD img/openshift.jpg ./img/openshift.jpg
VOLUME [ "data/" ]
EXPOSE 8080
CMD [ "npm", "start" ]
