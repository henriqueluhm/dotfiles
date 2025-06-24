export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="henzilla-grayscale"

plugins=(git zsh-vi-mode web-search copypath)

source $ZSH/oh-my-zsh.sh

# Custom aliases and functions
alias nv="nvim"
alias zs="nvim ~/.zshrc"
alias src="source ~/.zshrc"
alias lg="lazygit"
alias df="cd ~/dotfiles && nv"

function aliases() {
  grep -E '^\s*alias\s+' ~/.zshrc
}

function cmt() { 
  git commit -m "$@"
}

function gpt() {
  chatgpt "$@"
}

bindkey '^H' backward-kill-word

# PATH additions
export PATH=$PATH:~/Downloads/nvim-linux64/bin:~/.local/bin:~/.local/kitty.app/bin

# Logging commands function
log_command() {
    local command=$(fc -ln -1)
    local user="$USER"
    local datetime="$(date +'%Y-%m-%d %H:%M:%S')"

    if [ "$command" != "$PREV_COMMAND" ]; then
        logger -p local1.notice -t "user-shell[$$]" "$user ran command '$command'"
        PREV_COMMAND="$command"
    fi
}

PREV_COMMAND=""
preexec_functions+=(log_command)

# Zinit plugin manager loading
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

# Go environment variables
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

xset r rate 220 30


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
