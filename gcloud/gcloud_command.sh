#!/bin/sh

###############################

# google gcloud useful commands 

# ref 
# https://cloud.google.com/sdk/gcloud/
# https://cloud.google.com/pubsub/docs/quickstart-cli


###############################


# 0) install gcloud command line 
# https://cloud.google.com/sdk/downloads?hl=zh-TW
cd ~ && cd downloads/ && ./google-cloud-sdk/install.sh

# 1) gcloud init 

gcloud init 


# 2) auth login 
gcloud auth login

# 3) initialize  gcloud VM machine cluster


# 4) list compute instance 
gcloud compute instances list --filter="zone:europe-north1-a"











