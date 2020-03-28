#!/bin/bash

echo "installing neovim"
sudo apt install neovim

echo "installing ripgrep"
sudo apt install ripgrep

echo "installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "copying dotfiles to config directory"
rsync -av --progress ./* ~/ --exclude="readme.md" --exclude="install.sh" --exclude="updateRepo.sh" --exclude=".git" --exclude=".gitignore"

rm ~/install.sh
rm ~/updateRepo.sh

nvim +PlugInstall +:qa!

echo "uncomment all laptop parts for desktop and other way around i3/polybar/powermenu"
