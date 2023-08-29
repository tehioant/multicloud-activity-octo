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

.PHONY: check-app-name ## Check that app name is defined
check-app-name:
ifndef function_app_name
	$(error Env variable "function_app_name" is not defined)
endif

.PHONY: deploy-typescript-function ## Deploy function to AZF
deploy-typescript-function: check-app-name
	echo "[*] 🤖 make deploy-typescript-function: ${function_app_name}"
	npm run build
	echo "[*] 🤖 package built: ready to deploy"
	func azure functionapp publish ${function_app_name} --typescript


.PHONY: run-all-tests
run-all-tests:
	npm test