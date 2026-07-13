# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

. ${HOME}/.shell_path
. ${HOME}/.shell_alias
. ${HOME}/.shell_env
. ${HOME}/.shell_fn

if [ -f "${HOME}/.proxy_settings" ]; then
	. ${HOME}/.proxy_settings
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
