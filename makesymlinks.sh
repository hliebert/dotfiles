#!/bin/bash

# =============================== Setup dotfiles ===============================

# This script creates symlinks from the home directory to any desired dotfiles
# in ~/dotfiles

# dotfiles directory
dir=${HOME}/dotfiles
# old dotfiles backup directory
olddir=${HOME}/.dotfiles-old
# list of files/folders to symlink in homedir
files="bashrc bash_profile vimrc zshrc zshenv doom.d spacemacs xprofile rundo.sh Rprofile latexmkrc editorconfig gitconfig indentconfig"

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# create backupdir for vim
echo -n "Creating Vim backupdir/undodir in ~ ..."
mkdir -p ${HOME}/.backup-vim
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create
# symlinks from the homedir to any files in the ~/dotfiles directory specified
# in $files
for file in $files ; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ${HOME}/.$file ${HOME}/.dotfiles-old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ${HOME}/.$file
done
