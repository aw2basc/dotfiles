#!/bin/bash
sudo apt update
# essential
sudo apt install -y build-essential libssl-dev git curl xclip
# dev
sudo apt install -y cmake python-dev python3-dev python-pip libkrb5-dev nodejs npm default-jre default-jdk
# archive
sudo apt-get install -y unace unrar zip unzip p7zip-full p7zip-rar sharutils rar uudeview mpack arj cabextract file-roller
# zsh
sudo apt install -y zsh
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
# vim
sudo add-apt-repository -y ppa:jonathonf/vim
sudo apt update
sudo apt install -y vim vim-gtk3
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
# dotfiles
node dotfiles.js
# youcompleteme
sudo npm install -g tern typescript
~/.vim/bundle/YouCompleteMe/install.py --js-completer
cd ~/.vim/bundle/vimproc.vim && make
