#!/bin/bash

echo "installing neovim"
sudo apt install neovim

echo "installing ripgrep"
sudo apt install ripgrep

echo "installing vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "copying dotfiles to config directory"
cp -rf ./* ~/.config

rm ~./config/install.sh

nvim +PlugInstall +:qa!
