FROM node
WORKDIR /usr/src/app
COPY [ "server.js","index.html","package.json","./" ]
RUN npm install
ONBUILD COPY src/ .
ADD img/openshift.jpg ./img/openshift.jpg
EXPOSE 8080
CMD [ "npm", "start" ]
