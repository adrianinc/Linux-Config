#!/bin/bash

echo "Installing Linux config files..."

# Copying bashrc.d scripts
echo "1. Copying bash scripts to .bashrc.d. "
mkdir ~/.bashrc.d
cp -v ./bashrc.d/* ~/.bashrc.d/

printf '%s\n' 'if [ -d ~/.bashrc.d ]; then ' \
	'	for rc in ~/.bashrc.d/*; do ' \
	'		if [ -f "$rc" ]; then' \
	'			. "$rc" ' \
	'		fi ' \
	'	done ' \
'fi ' \
'unset rc ' >> ~/.bashrc
echo ""

# Copying user scripts
echo "2. Copying user scripts to ~/.local/bin. "
mkdir -p ~/.local/bin
cp -v ./scripts/* ~/.local/bin/
echo ""

echo "3. Copying bash script aliases into ~/.bash_aliases "
cat bash_aliases >> ~/.bash_aliases
echo ""

echo "4. Copying script to ~/.bash_logout "
cat bash_logout >> ~/.bash_logout 
echo ""

echo "5. Copying tmux configuration to ~/.tmux.conf"
cat tmux.conf >> ~/.tmux.conf 
echo ""

echo "6. Copying vim configuration to ~/.vimrc " 
cat vimrc >> ~/.vimrc 
echo ""

echo "7. Copy neovim configuration to ~/.config/nvim/init.vim" 
mkdir -pv ~/.config/nvim/
cat neovimrc >> ~/.config/nvim/init.vim 
echo ""


echo "Configuration finished. "
