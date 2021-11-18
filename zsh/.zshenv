# Explicitly configured $PATH variable
PATH=/usr/local/git/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/local/bin:/opt/local/sbin:/usr/X11/bin

# Custom exports
## Set EDITOR to /usr/bin/vim if Vim is installed
if [ -f /usr/bin/vim ]; then
  export EDITOR=/usr/bin/vim
fi

# fzf
if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
  export PATH="$PATH:$HOME/.fzf/bin"
fi

# Ledger file
# export LEDGER_FILE=~/Dropbox/org/hledger.journal

# pip local
export PATH="$PATH:$HOME/.local/bin"

# Anaconda3
# export PATH=$HOME/anaconda3/bin:$PATH

# trying to get rid of gh-pages warnings
export JEKYLL_GITHUB_TOKEN=
export SSL_CERT_FILE=$HOME/cacert.pem

# add snap to path
export PATH="$PATH:/snap/bin"

# add cargo to path
export PATH="$PATH:$HOME/.cargo/bin"

# add doom to path
export PATH="$PATH:$HOME/.emacs.d/bin"

# add latexindent to path
export PATH="$PATH:$HOME/.latexindent"
