#!/bin/sh
#
# This bash script is provides a quick setup for a debian based linux distribution
# It downloads and installes all tools I like and use
# This script will maipulate your ~/.bashrc. So maybe take a look at it after running the script.
# I am a beginner at bash and dash coding, so please dont just run this script without knowing what it does
# and what will be installed. Take a look at the code first, and manipulate it when needed.
# Also, I highly aprecheate contributing to this. If you got a nice idear how to improove this setup script,
# fork this repo, build your changes in and send me a pull request.

# Java Openjdk
sudo apt-get install openjdk-7-jdk

sudo apt-get install htop
# mysql
sudo apt-get install mysql-common mysql-workbench

# postgresql
sudo apt-get install postgresql pgadmin3 postgis

# curl
sudo apt-get install curl

# subversion
sudo apt-get install subversion

# git
sudo apt-get install git git-svn git-flow
sudo git config --global github.user JavaTheHood

# gradle
sudo apt-get install groovy gradle

# build essentials and python
sudo apt-get install build-essential cmake python-dev

# latex
sudo apt-get install texlive-full texmaker texstudio texworks
# TODO: arara,
curl -sOL dl.bintray.com/cereda/arara/arara-3.0-installer.jar && sudo java -jar arara-*.*-installer.jar && rm arara-*.*-installer.jar # rvm and ruby

cd ~/Vorlagen
git clone git@github.com:JavaTheHood/latexTemplates.git
cp ~/Vorlagen/latexTemplates ~/.vim/
if [ ! -d "$HOME/.rvm" ]; then
	curl -sSL https://get.rvm.io | bash -s stable --ruby
	gem install bundler
	gem install rubocop
fi

# set up vim
if [ ! -d "$HOME/.vim" ]; then
	apt-get install vim
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	if [ ! -d "$HOME/workspace/vimrc" ]; then
		git clone git@github.com:JavaTheHood/vimrc.git "$HOME/workspace/vimrc"
	fi
	cp "$HOME/workspace/vimrc/vim/vimrc" "$HOME/.vimrc"
	vim +PluginInstall +qall
	sh ~/.vim/bundle/youcompleteme/install.sh
	# todo - remap esc to capslock
fi

# set up tmux
apt-get install tmux
cp "$HOME/workspace/vimrc/tmux/tmux.conf" "$HOME/.tmux.conf"

# Intellij
if [ ! -d "/opt/jetbrains" ]; then
	mkdir "/opt/jetbrains"
	curl -Ls "http://download.jetbrains.com/idea/ideaIU-14.tar.gz" | tar -xvz -C /opt/jetbrains/
	curl -Ls "http://download.jetbrains.com/webstorm/WebStorm-9.0.1.tar.gz" | tar -xvz -C /opt/jetbrains/
	curl -Ls "http://download.jetbrains.com/ruby/RubyMine-6.3.3.tar.gz" | tar -xvz -C /opt/jetbrains/
fi

# Apache Maven
if [ -z "$M2_HOME" ]; then
	echo "Installing Maven"
	curl -Ls "https://mirror.arcor-online.net/www.apache.org/maven/maven-3/3.2.3/binaries/apache-maven-3.2.3-bin.tar.gz" | tar -xvz -C /usr/local/apache-maven/
	export M2_HOME="/usr/local/apache-maven/apache-maven-3.2.3"
	export M2="$M2_HOME/bin"
	export MAVEN_OPTS="-Xms256m -Xmx512m"
	export PATH="$PATH:$M2"

	echo export M2_HOME="/usr/local/apache-maven/apache-maven-3.2.3" >> "$HOME/.bashrc"
	echo export M2=\"\$M2_HOME/bin\" >> "$HOME/.bashrc"
	echo export MAVEN_OPTS=\"-Xms256m -Xmx512m\" >> "$HOME/.bashrc"
	echo export PATH=\"$PATH:$M2\" >> "$HOME/.bashrc"
fi

# Apache HBase
if [ ! -d "/opt/apache-hbase" ]; then
	echo "Installing Hbase"
	mkdir "/opt/apache-hbase"
	curl -Ls "http://mirrors.ae-online.de/apache/hbase/stable/hbase-0.98.7-hadoop2-bin.tar.gz" | tar -xvt -C /opt/apache-hbase/
fi
