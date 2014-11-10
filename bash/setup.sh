#!/bin/sh
#
# This bash script is provides a quick setup for a debian based linux distribution
# It downloads and installes all tools I like and use
# run as root!

if [ "$(whoami)" != "root" ]; then
	echo "Are you root?"
	exit 1
fi

# Java Openjdk
apt-get install openjdk-7-jdk

# mysql
apt-get install mysql-common mysql-workbench

# postgresql
apt-get install postgresql pgadmin3 postgis

# curl
apt-get install curl

# subversion
apt-get install subversion

# git
apt-get install git git-svn git-flow

# gradle
apt-get install groovy gradle

# rvm und ruby
if [ ! -d "$HOME/.rvm" ]; then
	exec curl -sSL https://get.rvm.io | bash -s stable
fi

# set up vim
if [ ! -d "$HOME/.vim" ]; then
	apt-get install vim
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	if [ ! -d "$HOME/workspace/vimrc" ]; then
		git clone git@github.com:JavaTheHood/vimrc.git "$HOME/workspace/vimrc"
	fi
	cp "$HOME/workspace/vimrc/vim/vimrc" "$HOME/.vimrc"
fi

# Intellij
if [ ! -d "/opt/jetbrains" ]; then
	mkdir "/opt/jetbrains"
	curl -Ls "http://download.jetbrains.com/idea/ideaIU-14.tar.gz" | tar -xvz -C /opt/jetbrains/
	curl -Ls "http://download.jetbrains.com/webstorm/WebStorm-9.0.1.tar.gz" | tar -xvz -C /opt/jetbrains/
	curl -Ls "http://download.jetbrains.com/ruby/RubyMine-6.3.3.tar.gz" | tar -xvz -C /opt/jetbrains/
fi

# Apache Maven
if [ -z "$M2_HOME" ]; then
	curl -Ls "https://mirror.arcor-online.net/www.apache.org/maven/maven-3/3.2.3/binaries/apache-maven-3.2.3-bin.tar.gz" | tar -xvz -C /usr/local/apache-maven/
	export M2_HOME="/usr/local/apache-maven/apache-maven-3.2.3"
	export M2="$M2_HOME/bin"
	export MAVEN_OPTS="-Xms256m -Xmx512m"
	export PATH="$PATH:$M2"

	echo export M2_HOME="/usr/local/apache-maven/apache-maven-3.2.3" >> "$HOME/.bashrc"
	echo export M2="$M2_HOME/bin" >> "$HOME/.bashrc"
	echo export MAVEN_OPTS="-Xms256m -Xmx512m" >> "$HOME/.bashrc"
	echo export PATH="$PATH:$M2" >> "$HOME/.bashrc"
fi

if [ ! -d "/opt/apache-hbase" ]; then
	mkdir /opt/apache-hbase
	curl -Ls "http://mirrors.ae-online.de/apache/hbase/stable/hbase-0.98.7-hadoop2-bin.tar.gz" | tar -xvt -C /opt/apache-hbase/
fi
