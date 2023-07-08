#!/bin/bash
git_packages="
junegunn/fzf
junegunn/fzf.vim
airblade/vim-gitgutter
tpope/vim-fugitive
"

mkdir -p ~/.vim/pack/myvim/start

for package in $git_packages
do
    git clone https://github.com/$package ~/.vim/pack/myvim/start
done

vim -s $(dirname "$0")/update_helptags.vim
