# This is an auto documented Makefile. For more information see the following article
# @see http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html

SHELL := /bin/bash
.SHELLFLAGS = -ec
.SILENT:
MAKEFLAGS += --silent
.ONESHELL:

.DEFAULT_GOAL := help

.PHONY: help ## 🛟 Show this prompts. All available targets with their documentation
help:
	echo "❓ Use \`make <target>' where <target> is one of 👇"
	grep -E '^\.PHONY: [a-zA-Z0-9_-]+ .*?##' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = "(: |##)"}; {printf "\033[36m%-30s\033[0m %s\n", $$2, $$3}'
	echo "Tips 💡"
	echo "	- use tab for auto-completion"
	echo "	- use the dry run option '-n' to show what make is attempting to do. example: environmentName=dev make -n restart-all"

.PHONY: azure-plan
azure-plan:
	echo "[*] 🤖 make azure-plan-resources"
	terraform -chdir=azure/ init
	terraform -chdir=azure/ validate
	terraform -chdir=azure/ plan

.PHONY: azure-apply
azure-apply:
	echo "[*] 🤖 make azure-apply-resources"
	terraform -chdir=azure/ init
	terraform -chdir=azure/ validate
	terraform -chdir=azure/ apply -auto-approve

.PHONY: azure-destroy
azure-destroy:
	echo "[*] 🤖 make azure-destroy-resources"
	terraform -chdir=azure/ init
	terraform -chdir=azure/ validate
	terraform -chdir=azure/ destroy -auto-approve

.PHONY: aws-plan
aws-plan:
	echo "[*] 🤖 make aws-plan-resources"
	terraform -chdir=aws/ init
	terraform -chdir=aws/ validate
	terraform -chdir=aws/ plan

.PHONY: aws-apply
aws-apply:
	echo "[*] 🤖 make aws-apply-resources"
	terraform -chdir=aws/ init
	terraform -chdir=aws/ validate
	terraform -chdir=aws/ apply -auto-approve

.PHONY: aws-destroy
aws-destroy:
	echo "[*] 🤖 make aws-destroy-resources"
	terraform -chdir=aws/ init
	terraform -chdir=aws/ validate
	terraform -chdir=aws/ destroy -auto-approve


.PHONY: gcp-plan
gcp-plan:
	echo "[*] 🤖 make gcp-plan-resources"
	terraform -chdir=gcp/ init
	terraform -chdir=gcp/ validate
	terraform -chdir=gcp/ plan

.PHONY: gcp-apply
gcp-apply:
	echo "[*] 🤖 make gcp-apply-resources"
	terraform -chdir=gcp/ init
	terraform -chdir=gcp/ validate
	terraform -chdir=gcp/ apply -auto-approve

.PHONY: gcp-destroy
gcp-destroy:
	echo "[*] 🤖 make gcp-destroy-resources"
	terraform -chdir=gcp/ init
	terraform -chdir=gcp/ validate
	terraform -chdir=gcp/ destroy -auto-approve

.PHONY: terraform-format  ## 🧹 to reformat every Terraform files
terraform-format:
	$(info [*] Formatting Terraform files ...)
	terraform fmt -recursive

.PHONY: terraform-upgrade  ## 🆕 to download new providers after you manually update their version
terraform-upgrade:
	$(info [*] Upgrade Terraform provider versions ...)
	terraform -chdir=backend/ init -upgrade
	terraform -chdir=azure/ init -upgrade
	terraform -chdir=aws/ init -upgrade
	terraform -chdir=gcp/ init -upgrade