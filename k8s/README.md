# Deploy
* oc apply -k k8s/overlays/node-prd
* oc apply -k k8s/overlays/node-hml
# Aplicar anotation
* oc annotate ns/node-hml openshift.io/requester=enable
# Aplicar cluster quota
* oc apply -f k8s/clusterquota.yaml