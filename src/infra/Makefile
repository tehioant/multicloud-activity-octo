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

.PHONY: plan-backend
plan-backend:
	echo "[*] 🤖 make plan-backend-resources"
	terraform -chdir=backend/ init
	terraform -chdir=backend/ validate
	terraform -chdir=backend/ plan

.PHONY: apply-backend
apply-backend:
	echo "[*] 🤖 make apply-backend-resources"
	terraform -chdir=backend/ init
	terraform -chdir=backend/ validate
	terraform -chdir=backend/ apply -auto-approve

.PHONY: destroy-backend
destroy-backend:
	echo "[*] 🤖 make destroy-backend-resources"
	terraform -chdir=backend/ init
	terraform -chdir=backend/ validate
	terraform -chdir=backend/ destroy -auto-approve

.PHONY: plan-azure
plan-azure:
	echo "[*] 🤖 make plan-azure-resources"
	terraform -chdir=azure/ init
	terraform -chdir=azure/ validate
	terraform -chdir=azure/ plan

.PHONY: apply-azure
apply-azure:
	echo "[*] 🤖 make apply-azure-resources"
	terraform -chdir=azure/ init
	terraform -chdir=azure/ validate
	terraform -chdir=azure/ apply -auto-approve

.PHONY: destroy-azure
destroy-azure:
	echo "[*] 🤖 make destroy-azure-resources"
	terraform -chdir=azure/ init
	terraform -chdir=azure/ validate
	terraform -chdir=azure/ destroy -auto-approve

.PHONY: plan-aws
plan-aws:
	echo "[*] 🤖 make plan-aws-resources"
	terraform -chdir=aws/ init
	terraform -chdir=aws/ validate
	terraform -chdir=aws/ plan

.PHONY: apply-aws
apply-aws:
	echo "[*] 🤖 make apply-aws-resources"
	terraform -chdir=aws/ init
	terraform -chdir=aws/ validate
	terraform -chdir=aws/ apply -auto-approve

.PHONY: destroy-aws
destroy-aws:
	echo "[*] 🤖 make destroy-aws-resources"
	terraform -chdir=aws/ init
	terraform -chdir=aws/ validate
	terraform -chdir=aws/ destroy -auto-approve

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