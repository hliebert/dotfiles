# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/antigen.zsh
antigen theme romkatv/powerlevel10k
antigen use oh-my-zsh
antigen bundle command-not-found
# antigen bundle common-aliases
# antigen bundle alias-finder
antigen bundle fzf
antigen bundle git
antigen bundle python
antigen bundle zsh-syntax-highlighting
antigen bundle zsh-completions
antigen bundle sudo
antigen bundle ubuntu
antigen bundle emacs
antigen bundle vim-interaction
antigen apply


# other stuff
export ALTERNATE_EDITOR=""

## Shell Aliases
# Emacs Aliases
alias vim="vim --servername VIM"
alias emc='emacsclient -nc -a ""'
alias emt='emacsclient -nw -a ""'
alias fd='fdfind'
# alias R='R --no-restore-history --no-save'
alias R='R --no-save'
alias latexindent='latexindent -m -g /dev/null -l="$HOME/.latexindent.yaml"'

# Git Aliases
# alias gs='git status '
# alias ga='git add '
# alias gb='git branch '
# alias gc='git commit'
# alias gd='git diff'
# alias go='git checkout '
# alias gk='gitk --all&'
# alias gx='gitx --all'
# alias got='git '
# alias get='git '

# Miscellaneous Aliases
# alias htop='sudo htop'

# Shell Functions
# qfind - used to quickly find files that contain a string in a directory
qfind () {
  find . -exec grep -l -s $1 {} \;
  return 0
}

# fzf
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh


# fix CURL certificates path
export CURL_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/hliebe/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/hliebe/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/hliebe/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/hliebe/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

