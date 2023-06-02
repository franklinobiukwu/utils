#!/bin/bash

# Ask to install betty
read -p "Would you like to install betty? (yes/no): " response

# Convert user response to lowercase
lowercaseResponse=$(echo "$response" | tr '[:upper:]' '[:lower:]')

if [[ "$lowercaseResponse" == "yes" ]]; then
	# install betty
	cd ~
	git clone https://github.com/alx-tools/Betty.git && cd Betty/
	sudo ./install.sh
	cd -
fi

# Setup betty linting configuration for vim
read -p "Do you want to setup vim for betty lint? (yes/no): " vimResponse
# Convert user response to lowercase
lowercaseVimResponse=$(echo "$vimResponse" | tr '[:upper:]' '[:lower:]')

if [[ "$lowercaseVimResponse" == "yes" ]]; then
	# Append Vim conficuration to .vimrc file
	echo -e "\n\" Betty linting configuration" >> ~/.vimrc
	echo 'set nocompatible
set tabstop=8 shiftwidth=8
set autoindent
set smartindent
set cindent
syntax enable
set number
match Todo /\s\+$/
:set formatoptions+=r' >> ~/.vimrc
fi

echo "Complete!!"
