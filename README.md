# Building own Node.js image
	podman build -t node-app:latest .
	
	podman run -it --rm --name nodejs -p 8080:8080 node-app:latest

# Deploy OCP
	oc new-project node --display-name "Simple Node Example"	
	
	oc new-app --name node --labels app=nodejs --strategy=source https://github.com/laurobmb/Node-Js-Sample-Project.git
	
	oc expose service node
	
	oc create route edge node-tls --service node

    oc set resources deployment node --limits=cpu=200m,memory=128Mi --requests=cpu=100m,memory=64Mi
    
	oc set probe deployment/node --readiness --initial-delay-seconds=10 --timeout-seconds=30 --get-url=http://:8080/health
    
	oc set probe deployment/node --liveness --initial-delay-seconds=10 --timeout-seconds=30 --get-url=http://:8080/health
    
	oc autoscale deployment node --max 50 --min 3 --cpu-percent=80

## Delete app 
	oc delete all -l app=nodejs