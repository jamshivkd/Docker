#/bin/bash
echo " This script deploy Jenkins Master on Kubernet cluster"
echo " ####################################################"
echo  " Eg:
Deployment Name  :  master1
"
echo "###########################################################"

echo -e  "\n"
echo " Enter Deployment Name"
read DPLY_NAME

kubectl create configmap "$DPLY_NAME"-config  --from-file=config-map-master  -o yaml --dry-run=client | kubectl apply -n devops-tools -f -

helm install $DPLY_NAME jenkinsmaster  --set volumes.volName="$DPLY_NAME"-vol --set volumes.claimName="$DPLY_NAME"-volclaim --set service.name="$DPLY_NAME"-service --set deployment.name="$DPLY_NAME"-deployment --set  service.app="$DPLY_NAME"-app  --set deployment.app="$DPLY_NAME"-app --set host.name="$DPLY_NAME"-jenkins --set configmap.name="$DPLY_NAME"-config --set  volumes.path="$DPLY_NAME"_home

 sleep 180

echo "Jenkins Slave Pod has been created successfully"

echo "###############################################

     Deployment Name  :  $DPLY_NAME
     service Name     : "$DPLY_NAME"-service
     Service App      : "$DPLY_NAME"-app
     Deployment name        : "$DPLY_NAME"-deployment
     Deployment app         : "$DPLY_NAME"-app
     volumes claimName: "$DPLY_NAME"-volclaim

echo ##############################################" > "$DPLY_NAME"-result.txt

echo " Internal IP and port details " >>  "$DPLY_NAME"-result.txt

IP_PORT=$( kubectl get service  -n devops-tools | grep "$DPLY_NAME"-service )
echo "$IP_PORT" >>  "$DPLY_NAME"-result.txt
cat  "$DPLY_NAME"-result.txt
#mail -s "Deployment details" jchittan@relay.qa.akamai.com < result.txt

