#!/usr/bin/env bash

# List MFA enabled status for the root user
# from https://cloudonaut.io/diy-aws-security-review/

set -e
set -u
set -o pipefail

aws iam get-account-summary --query "SummaryMap.AccountMFAEnabled"
