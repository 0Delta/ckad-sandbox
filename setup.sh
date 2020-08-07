#!/bin/bash

gcloud auth login

gcloud container clusters create anti-ckad-cluster \
--project=${PROJECT} --zone=${ZONE} \
--preemptible --enable-network-policy

/bin/bash
