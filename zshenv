# Explicitly configured $PATH variable
PATH=/usr/local/git/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/local/bin:/opt/local/sbin:/usr/X11/bin

# Custom exports
## Set EDITOR to /usr/bin/vim if Vim is installed
if [ -f /usr/bin/vim ]; then
  export EDITOR=/usr/bin/vim
fi

# fzf
if [[ ! "$PATH" == */home/hliebe/.fzf/bin* ]]; then
  export PATH="$PATH:/home/hliebe/.fzf/bin"
fi

# Ledger file
# export LEDGER_FILE=~/Dropbox/org/hledger.journal

# pip local
export PATH="$PATH:/home/hliebe/.local/bin"

# Anaconda3
# export PATH=/home/hliebe/anaconda3/bin:$PATH

# trying to get rid of gh-pages warnings
export JEKYLL_GITHUB_TOKEN=
export SSL_CERT_FILE=/home/hliebe/cacert.pem

# add snap to path
export PATH="$PATH:/snap/bin"

# add cargo to path
export PATH="$PATH:/home/hliebe/.cargo/bin"
