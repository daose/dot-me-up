#!/bin/bash
# mkdir -p ~/.config/alacritty && ln -s $(pwd)/.config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -s $(dirname "$0")/.tmux.conf ~/.tmux.conf
ln -s $(dirname "$0")/.vimrc ~/.vimrc
$(dirname "$0")/setup_vim.sh
