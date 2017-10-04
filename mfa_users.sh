#!/usr/bin/env bash

# List MFA enabled status for all IAM users
# from https://cloudonaut.io/diy-aws-security-review/

set -e
set -u
set -o pipefail

usernames=$(aws iam list-users --query "Users[].[UserName]" --output text)
while read -r username; do
  c=$(aws iam list-mfa-devices --user-name "$username" --query "length(MFADevices)" --output text)
  echo "$username,$c"
done <<< "$usernames"
