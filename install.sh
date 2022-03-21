#!/bin/bash
mkdir -p ~/.config/nvim && ln -s $(pwd)/.config/nvim/init.vim ~/.config/nvim/init.vim && ./install_nvim_plugins.sh
mkdir -p ~/.config/alacritty && ln -s $(pwd)/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s $(pwd)/.tmux.conf ~/.tmux.conf
