#!/usr/bin/env bash

# list reasons for all stopped EC2 instances

set -e
set -u
set -o pipefail

regions=$(aws ec2 describe-regions \
  --output text \
  --query 'Regions[*].RegionName')

for region in $regions; do
  aws ec2 describe-instances \
    --filters Name=instance-state-name,Values=stopped \
    --region $region \
    --output json | jq -r .Reservations[].Instances[] .StateReason.Message
done
