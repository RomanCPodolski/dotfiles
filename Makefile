PROJECT_NAME := dotfiles
VERSION := 1.0

DOTFILES_DIR := $(shell pwd)
HOME_DIR := $(HOME)

NO_PROXY := "localhost,127.0.0.1"

SHELL_ALIAS 		:= $(DOTFILES_DIR)/.shell_alias
SHELL_ENV 			:= $(DOTFILES_DIR)/.shell_env
SHELL_FN 			:= $(DOTFILES_DIR)/.shell_fn
SHELL_PATH 		:= $(DOTFILES_DIR)/.shell_path

BASH_PROFILE	:= $(DOTFILES_DIR)/.bash_profile
BASH_CONFIG 	:= $(DOTFILES_DIR)/.bashrc

GIT_CONFIG 		:= $(DOTFILES_DIR)/.gitconfig
NVIM_CONFIG 	:= $(DOTFILES_DIR)/nvim
VIMRC 				:= $(DOTFILES_DIR)/.vimrc
ZSHRC 				:= $(DOTFILES_DIR)/.zshrc

TMUX_CONFIG 		:= $(DOTFILES_DIR)/.tmux.conf
TMUX_LOCAL_CONFIG := $(DOTFILES_DIR)/.tmux.conf.local

link-shell:
	ln -sf $(SHELL_ALIAS) $(HOME_DIR)/.shell_alias
	ln -sf $(SHELL_ENV) $(HOME_DIR)/.shell_env
	ln -sf $(SHELL_FN) $(HOME_DIR)/.shell_fn
	ln -sf $(SHELL_PATH) $(HOME_DIR)/.shell_path

## link bash configuration
link-bash: link-shell
	ln -sf $(BASH_PROFILE) $(HOME_DIR)/.bash_profile
	ln -sf $(BASH_CONFIG) $(HOME_DIR)/.bashrc

## link zsh configuration
link-zsh: link-shell
	ln -sf $(ZSHRC) $(HOME_DIR)/.zshrc

## link git configuration
link-git:
	ln -sf $(GIT_CONFIG) $(HOME_DIR)/.gitconfig

## link neovim configuration
link-nvim:
	mkdir -p $(HOME_DIR)/.config
	ln -sf $(NVIM_CONFIG) $(HOME_DIR)/.config/nvim

## link vim configuration
link-vim:
	ln -sf $(VIMRC) $(HOME_DIR)/.vimrc

## link tmux configuration
link-tmux:
	ln -sf $(TMUX_CONFIG) $(HOME_DIR)/.tmux.conf
	ln -sf $(TMUX_LOCAL_CONFIG) $(HOME_DIR)/.tmux.conf.local

## link all configuration
link-all: link-bash link-zsh link-git link-nvim link-vim link-tmux

## install neovim binary
install-neovim:
	@echo "Installing Neovim..."
	cd /tmp && \
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz && \
	sudo rm -rf /opt/nvim-linux-x86_64 && \
	sudo tar -C /opt -xzf /tmp/nvim-linux-x86_64.tar.gz && \
	rm -f /tmp/nvim-linux-x86_64.tar.gz

## install zsh and set as default shell
install-zsh:
	@echo "Installing zsh..."
	sudo apt install zsh -y
	sudo chsh -s /bin/zsh $(whoami)

## install all dependencies
install-all: install-neovim #install-zsh

## full setup for open (online) environment
setup-open: install-all link-all

## setup for airgapped environment (no network installs)
setup-airgapped: link-bash link-git link-vim link-tmux

## remove all symlinks
unlink-all:
	rm -f $(HOME_DIR)/.shell_alias $(HOME_DIR)/.shell_env $(HOME_DIR)/.shell_fn $(HOME_DIR)/.shell_path
	rm -f $(HOME_DIR)/.bash_profile $(HOME_DIR)/.bashrc
	rm -f $(HOME_DIR)/.zshrc
	rm -f $(HOME_DIR)/.gitconfig
	rm -f $(HOME_DIR)/.config/nvim
	rm -f $(HOME_DIR)/.vimrc
	rm -f $(HOME_DIR)/.tmux.conf $(HOME_DIR)/.tmux.conf.local


#################################################################################
# Self Documenting Commands                                                     #
#################################################################################

.DEFAULT_GOAL := all

# Inspired by <http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html>
# sed script explained:
# /^##/:
#	* save line in hold space
#	* purge line
#	* Loop:
#		* append newline + line to hold space
#		* go to next line
#		* if line starts with doc comment, strip comment character off and loop
#	* remove target prerequisites
#	* append hold space (+ newline) to line
#	* replace newline plus comments by `---`
#	* print line
# Separate expressions are necessary because labels cannot be delimited by
# semicolon; see <http://stackoverflow.com/a/11799865/1968>
.PHONY: show-help
show-help:
	@echo "$(PROJECT_NAME) version $(VERSION)"
	@echo
	@echo "$$(tput bold)Available rules:$$(tput sgr0)"
	@sed -n -e "/^## / { \
		h; \
		s/.*//; \
		:doc" \
		-e "H; \
		n; \
		s/^## //; \
		t doc" \
		-e "s/:.*//; \
		G; \
		s/\\n## /---/; \
		s/\\n/ /g; \
		p; \
	}" ${MAKEFILE_LIST} \
	| LC_ALL='C' sort --ignore-case \
	| awk -F '---' \
		-v ncol=$$(tput cols) \
		-v indent=19 \
		-v col_on="$$(tput setaf 6)" \
		-v col_off="$$(tput sgr0)" \
	'{ \
		printf "%s%*s%s ", col_on, -indent, $$1, col_off; \
		n = split($$2, words, " "); \
		line_length = ncol - indent; \
		for (i = 1; i <= n; i++) { \
			line_length -= length(words[i]) + 1; \
			if (line_length <= 0) { \
				line_length = ncol - indent - length(words[i]) - 1; \
				printf "\n%*s ", -indent, " "; \
			} \
			printf "%s ", words[i]; \
		} \
		printf "\n"; \
	}' \
	| more $(shell test $(shell uname) = Darwin && echo '--no-init --raw-control-chars')

## Show this message
help: show-help
