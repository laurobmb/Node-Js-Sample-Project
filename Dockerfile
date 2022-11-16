FROM node:19-alpine
USER 1000
WORKDIR /home/node/
COPY [ "server.js","index.html","package.json","./" ]
RUN npm install
ONBUILD COPY src/ page/
ADD img/openshift.jpg ./img/openshift.jpg
VOLUME [ "data/" ]
EXPOSE 8080
CMD [ "npm", "start" ]
