#!/bin/bash

# Input arguments
REGION="${1:-us-east-1}"
VERSION="${2:-latest}"

./deploy-cluster.sh $REGION
./deploy-to-ecr.sh $REGION $VERSION
./deploy-database.sh
./deploy-blue-deployment.sh $REGION $VERSION
./deploy-autoscaling.sh

LB_DNS_NAME=$(kubectl get svc angular-lb --namespace default -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')

# Check if DNS name was retrieved
if [ -z "$LB_DNS_NAME" ]; then
  echo "Failed to retrieve the DNS name of the LoadBalancer."
  exit 1
else
  echo "You will be able to access the Angular app via: http://$LB_DNS_NAME"
fi