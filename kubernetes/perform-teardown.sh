#!/bin/bash

# Input arguments
REGION="${1:-us-east-1}"

./delete-cluster.sh $REGION
./delete-ecr.sh $REGION