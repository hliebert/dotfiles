# Explicitly configured $PATH variable
PATH=/usr/local/git/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/local/bin:/opt/local/sbin:/usr/X11/bin

# Custom exports
## Set EDITOR to /usr/bin/vim if Vim is installed
if [ -f /usr/bin/vim ]; then
  export EDITOR=/usr/bin/vim
fi

# fzf
if [[ ! "$PATH" == */home/helge/.fzf/bin* ]]; then
  export PATH="$PATH:/home/helge/.fzf/bin"
fi


# Ledger file
export LEDGER_FILE=~/Dropbox/org/hledger.journal

# pip local 
export PATH="$PATH:/home/helge/.local/bin"

# Anaconda3
# export PATH=/home/helge/anaconda3/bin:$PATH

# trying to get rid of gh-pages warnings
export JEKYLL_GITHUB_TOKEN=2346a805b1ec031a6e8960774256556ee7414600
export SSL_CERT_FILE=/home/helge/cacert.pem
