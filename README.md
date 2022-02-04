# Building own Node.js image

	podman build -t node-app:latest .
	podman run -it --rm --name nodejs -p 8080:8080 node-app:latest

# Deploy OCP
	
	oc new-app --name node --labels app=nodejs --strategy=source https://github.com/laurobmb/Node-Js-Sample-Project.git
