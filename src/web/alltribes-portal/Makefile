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

.PHONY: upload-s3
upload-s3:
	echo "[*] 🤖 make upload-s3: s3://bucket-alltribes/alltribesportal.zip"
	npm run build
	zip -r alltribes-portal.zip dist
	aws s3 cp alltribes-portal.zip s3://bucket-alltribes/alltribesportal.zip