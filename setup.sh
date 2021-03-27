#!/bin/sh

mkdir ~/.config

ln -s $PWD/nvim $HOME/.config/nvim
ln -s $PWD/picom $HOME/.config/picom
ln -s $PWD/kitty $HOME/.config/kitty

ln -s $PWD/.conkyrc $HOME/.conkyrc
ln -s $PWD/.zshrc $HOME/.zshrc
ln -s $PWD/.tmux.conf $HOME/.tmux.conf
ln -s $PWD/.xmonad $HOME/.xmonad

ln -s $PWD/configuration.nix /etc/nixos/configuration.nix
