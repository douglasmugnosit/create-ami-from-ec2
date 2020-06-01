#!/bin/bash

#########
# DISCLAIMER
# THIS IS NOT A PRODUCTION SCRIPT. BEFORE USE IT IN PRODUCTION MAKE SURE YOU TESTED
# IT IN YOUR LINUX FLAVOR/VERSION. I SUGGEST YOU TO  ADD CONDITIONS AND LOGGING
# TO HELP YOU TROUBLESHOOT IN CASE YOU NEED. THIS IS A TEMPLATE CREATED AS EXAMPLE 
# SO YOU CAN/MUST IMPROVE AND ADJUST TO YOUR NEEDs
#########

#GET AWS INSTANCE ID
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)

#Get AWS Region
REGION_ID=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | grep -oP '\"region\" : \"\K[^\"]+')

#Image description and Name
IMAGE_DESCRIPTION="AUTO BACKUP EXECUTED INSIDE SERVER"
IMAGE_NAME="$(hostname)-$(date +%Y-%m-%d-%H-%M-%Z)"

#create image
aws ec2 create-image --name ${IMAGE_NAME}\
                 --description "${IMAGE_DESCRIPTION}" \
                 --region ${REGION_ID}\
                 --instance-id ${INSTANCE_ID} \
                 --no-reboot 
