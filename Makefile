.DEFAULT_GOAL := usage

# user and repo
USER        = $$(whoami)
CURRENT_DIR = $(notdir $(shell pwd))

# terminal colours
RED     = \033[0;31m
GREEN   = \033[0;32m
YELLOW  = \033[0;33m
NC      = \033[0m

.PHONY: rubocop-fix
rubocop-fix:
	bundle exec rubocop -A

.PHONY: rubocop
rubocop:
	bundle exec rubocop

.PHONY: rspec
rspec:
	bundle exec rspec

.PHONY: rswag
rswag:
	bin/rails rswag
	@echo "check-out the docs at http://127.0.0.1:3000/api-docs"

.PHONY: build
build: rubocop rspec

.PHONY: usage
usage:
	@echo
	@echo "Hi ${GREEN}${USER}!${NC} Welcome to ${RED}${CURRENT_DIR}${NC}"
	@echo
	@echo "Getting started"
	@echo
	@echo "Development"
	@echo
	@echo "${YELLOW}make rspec${NC}        run rspec tests"
	@echo "${YELLOW}make rswag${NC}        generate API docs via rswag"
	@echo "${YELLOW}make rubocop${NC}      rubocop"
	@echo "${YELLOW}make rubocop-fix${NC}  rubocop fix"
	@echo
