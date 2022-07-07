FROM node
WORKDIR /usr/src/app
COPY [ "server.js","index.html","package.json","./" ]

RUN npm config set timeout 6000000 &&\
    npm config set cache-min 3600 &&\
    npm config set fetch-timeout 60000 &&\
    RUN npm config set proxy false

RUN npm install ;\
    mkdir data
ONBUILD COPY src/ .
ADD img/openshift.jpg ./img/openshift.jpg
VOLUME [ "data/" ]
EXPOSE 8080
CMD [ "npm", "start" ]
