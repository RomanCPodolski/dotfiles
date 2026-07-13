# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

SSH_ENV="$HOME/.ssh/agent-environment"

function start_agent {
	echo "Initialising new SSH agent..."
	/usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
	echo succeeded
	chmod 600 "${SSH_ENV}"
	. "${SSH_ENV}" > /dev/null
	/usr/bin/ssh-add;
}

if [ -f "${SSH_ENV}" ]; then
	. "${SSH_ENV}" > /dev/null
	# ps ${SSH_AGENT_PID} doesn't work under cygwin
	ps -ef | grep ${SSH_AGENT_PID} | grep ssh_agent$ > /dev/null || start_agent;
else
	start_agent
fi

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH

# pip bash completion start
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip
# pip bash completion end
#
export TERM=xterm-256color
