#!/bin/sh
git_packages="
ellisonleao/gruvbox.nvim
rust-lang/rust.vim
tpope/vim-fugitive
vmchale/dhall-vim
neovim/nvim-lspconfig
ms-jpq/coq_nvim
nvim-treesitter/nvim-treesitter
simeji/winresizer
voldikss/vim-floaterm

lewis6991/gitsigns.nvim
nvim-lua/plenary.nvim

junegunn/fzf
junegunn/fzf.vim
"

mkdir -p ~/.local/share/nvim/site/pack/myvim/start
cd ~/.local/share/nvim/site/pack/myvim/start

for package in $git_packages
do
    git clone https://github.com/$package
done

nvim --cmd "helptags ALL" --cmd "q"
echo "Updated helptags"
