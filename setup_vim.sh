#!/bin/bash
git_packages="
junegunn/fzf
junegunn/fzf.vim
"

mkdir -p ~/.vim/pack/myvim/start
cd ~/.vim/pack/myvim/start

for package in $git_packages
do
    git clone https://github.com/$package
done

vim -s update_helptags.vim
