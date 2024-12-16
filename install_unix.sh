#!/bin/bash

# Ensure the script fails if a command fails.
set -euxo pipefail

echo "[bc-dot-me-up] dot-me-up installing"

mkdir -p ./build
mkdir -p ./bin
cd build

if [ ! -d "./tmux-3.4" ]; then
  echo "[bc-dot-me-up] tmux 3.4 installing"
  wget --no-clobber https://github.com/tmux/tmux/releases/download/3.4/tmux-3.4.tar.gz
  tar -xzvf tmux-3.4.tar.gz
  cd tmux-3.4
  sudo apt-get -y install libevent-dev
  sudo apt-get -y install bison
  ./configure
  make
  cp -f ./tmux ../../bin
  cd ../
fi

cd ../

last_line=$(tail -n 1 .my_rc)
# Don't store tmux conf into ~/.tmux.conf, for some reason C-j on fzf is captured
# unless the config is loaded via -f flag
alias_command="function tmux { $(pwd)/bin/tmux -f $(pwd)/.tmux.conf \"\$@\"; }"
! [ "$last_line" = "$alias_command" ] && [ -f ./.tmux.conf ] && echo "$alias_command" >> .my_rc
echo "[bc-dot-me-up] installed tmux conf"

echo "[bc-dot-me-up] downloading v0.10.0 neovim"
wget --no-clobber "https://github.com/neovim/neovim/releases/download/v0.10.2/nvim.appimage"
chmod +x nvim.appimage

echo "[bc-dot-me-up] aliasing it to nvim"
touch .my_rc
last_line=$(tail -n 1 .my_rc)
alias_command="function nvim { $(pwd)/nvim.appimage -u $(pwd)/init.vim \"\$@\"; }"
! [ "$last_line" = "$alias_command" ] && [ -f .my_rc ] && echo "$alias_command" >> .my_rc

echo "[bc-dot-me-up] updating bashrc with .my_rc"
touch ~/.bashrc
last_line=$(tail -n 1 ~/.bashrc)
source_myrc_command=$(echo source ~+/.my_rc)
! [ "$last_line" = "$source_myrc_command" ] && [ -f ~+/.my_rc ] && echo $source_myrc_command >> ~/.bashrc
echo "[bc-dot-me-up] installed .my_rc"

echo "[bc-dot-me-up] installing neovim plugins"
git_packages="junegunn/fzf
junegunn/fzf.vim
simeji/winresizer
airblade/vim-gitgutter
neoclide/coc.nvim --branch release
tpope/vim-fugitive
tpope/vim-rhubarb"

rm -rf ~/.local/share/nvim/site/pack/myvim/start
mkdir -p ~/.local/share/nvim/site/pack/myvim/start
cd ~/.local/share/nvim/site/pack/myvim/start

echo "$git_packages" | while read -r line ; do
  git clone https://github.com/$line
done

cd -

echo "[bc-dot-me-up] installing coc.nvim settings"
mkdir -p ~/.config/nvim
cp -f ./coc-settings.json ~/.config/nvim/
