FROM node
WORKDIR /usr/src/app
COPY [ "server.js","index.html","package.json","./" ]
RUN npm install
ONBUILD COPY . /usr/src/app
EXPOSE 8080
CMD [ "npm", "start" ]
