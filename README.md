# Building own Node.js image
	buildah build --format docker -t node-app:latest .	
	podman run -it --rm --name nodejs -p 8080:8080 node-app:latest
# Deploy OCP
    oc new-project node --display-name "Simple Node Example"	
---
### Strategy deploy source
    oc new-app --name node --labels app=nodejs --strategy=source https://github.com/laurobmb/Node-Js-Sample-Project#nodejs-redhat
### Strategy deploy source (oc version 4.11)
    oc new-app --name node --labels app=nodejs registry.access.redhat.com/ubi8/nodejs-16:latest~https://github.com/laurobmb/Node-Js-Sample-Project#nodejs-redhat
### Strategy deploy docker
    oc new-app --name node --labels app=nodejs --strategy=docker https://github.com/laurobmb/Node-Js-Sample-Project#nodejs-redhat
---
* oc expose service node
* oc create route edge node-tls --service node
* oc set resources deployment node --limits=cpu=200m,memory=128Mi --requests=cpu=100m,memory=64Mi
* oc set probe deployment/node --readiness --initial-delay-seconds=10 --timeout-seconds=30 --get-url=http://:8080/health
* oc set probe deployment/node --liveness --initial-delay-seconds=10 --timeout-seconds=30 --get-url=http://:8080/health
* oc autoscale deployment node --max 50 --min 3 --cpu-percent=80
# Deploy using yaml
    oc delete -k k8s/overlays/node-prd
    oc delete -k k8s/overlays/node-hml
    oc delete -k k8s/overlays/node-uat
    oc delete -k k8s/overlays/node-uat-docker
# Delete app 
* oc delete all -l app=nodejs
# Set Volumes o container
Check file list of container http://127.0.0.1:8080/files
### Podman 
* podman run -it --rm --name node -v /your/files:/usr/src/app/data:Z -p8080:8080 node:v1 	
* podman run -it --rm --name node -p8080:8080 node:v1 
* podman cp yourfile.txt node:/usr/src/app/data
### Openshift
Create node-pvc PVC before set volume of container
* oc -n node set volume deployment/node --add --mount-path=/usr/src/app/data --name=node-volume-persistent -t pvc --claim-name=node-pvc
* oc rsync  ./local/dir/filename <pod-name>:/usr/src/app/data

