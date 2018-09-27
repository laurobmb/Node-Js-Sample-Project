Building own Node.js image
Goal: The purpose of this image is to Create Node js Application

Steps to building your own image
Be in the directory Node-Js-Sample-App

cd Node-Js-Sample-App
docker build -t goldentech/node-app .
docker run -p 8080:8080 -d <user-name>/<image-name>
docker run -p 8080:8080 -d goldentech/node-app
Saving the image to docker hub
Register for an account on hub.docker.com
In server machine
# docker login
# docker images
# docker push docker-user_id/image-name
# docker push goldentech/node-app
