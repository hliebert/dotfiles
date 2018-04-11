#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=${HOME}/dotfiles                    # dotfiles directory
olddir=${HOME}/.dotfiles-old            # old dotfiles backup directory
files="bashrc bash_profile vimrc zshrc zshenv doom spacemacs xprofile rundo.sh Rprofile"    # list of files/folders to symlink in homedir

##########

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

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files ; do
    if [[ $file == 'doom' ]]; then
      echo "Moving any existing dotfiles from ~/.config to $olddir"
      mv ${HOME}/.config/$file ${HOME}/.dotfiles-old/
      echo "Creating symlink to $file in ~/.config."
      ln -s $dir/$file ${HOME}/.config/doom 
    else
      echo "Moving any existing dotfiles from ~ to $olddir"
      mv ${HOME}/.$file ${HOME}/.dotfiles-old/
      echo "Creating symlink to $file in home directory."
      ln -s $dir/$file ${HOME}/.$file
    fi
done

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d ${HOME}/.oh-my-zsh/ ]]; then
        mkdir ${HOME}/.oh-my-zsh
        git clone https://github.com/robbyrussell/oh-my-zsh.git ${HOME}/.oh-my-zsh/
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        if [[ -f /etc/arch-release ]]; then
            sudo pacman -S zsh
            install_zsh
        fi
        if [[ -f /etc/redhat-release ]]; then
            sudo yum install zsh
            install_zsh
        fi
        if [[ -f /etc/debian_version ]]; then
            sudo apt-get install zsh
            install_zsh
        fi
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
fi
}

install_zsh

