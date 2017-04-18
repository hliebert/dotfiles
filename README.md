Dotfiles
========

This repository includes most of my dotfiles.  They should be cloned to your
home directory so that the path is `~/dotfiles/`.  The included setup script
creates symlinks from your home directory to the files which are located in
`~/dotfiles/`. A backup of existing files is created in `~/.dotfiles_old/`.  The
script alo checks for and installs zsh and oh-my-zsh and sets it as the default
shell. I took inspiration from a blog post by Michael J. Smalley and have
adapted most of his setup.

Usage
------------

``` bash
git clone git://github.com/hliebert/dotfiles ~/dotfiles
cd ~/dotfiles
./makesymlinks.sh
