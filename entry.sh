#!/bin/bash
gcloud auth login

echo create cluster
gcloud container clusters create ${CLUSTER_NAME} \
--project=${PROJECT} --zone=${ZONE} \
--preemptible --enable-network-policy ${CLUSTER_ARGS}

/bin/bash -l

echo delete cluster
gcloud container clusters delete ${CLUSTER_NAME} \
--project=${PROJECT} --zone=${ZONE} --quiet
echo done
