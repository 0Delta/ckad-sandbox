#!/bin/bash

gcloud container clusters delete anti-ckad-cluster \
--project=${PROJECT} --zone=${ZONE} --quiet
