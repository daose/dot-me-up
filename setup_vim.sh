#!/bin/bash
git_packages="
junegunn/fzf
junegunn/fzf.vim

airblade/vim-gitgutter
tpope/vim-fugitive

dense-analysis/ale
rust-lang/rust.vim
simeji/winresizer
"

mkdir -p ~/.vim/pack/myvim/start
cd ~/.vim/pack/myvim/start

for package in $git_packages
do
    git clone https://github.com/$package
done

vim -s $(dirname "$0")/update_helptags.vim
