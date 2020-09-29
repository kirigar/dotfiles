# Set the prompt
autoload -Uz promptinit
promptinit
prompt pure

# Enable basic autocompletion
autoload -Uz compinit
zstyle ':completion:*' menu select 
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
compinit
_comp_options+=(globdots)  # Enable autocompletion for dotfiles

# Enable zsh batch renaming
autoload -Uz zmv

# Enable vi mode
bindkey -v

# Reduce vim mode delay (might break certain programs)
export KEYTIMEOUT=1

# Enable history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$XDG_CACHE_HOME"/zsh/history

# Enable color for less
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'    
export LESS_TERMCAP_md=$'\E[1;36m'    
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_se=$'\E[0m'       
export LESS_TERMCAP_us=$'\E[1;32m'    
export LESS_TERMCAP_ue=$'\E[0m'       

# Set aliases
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias ls="ls -h --color=auto --group-directories-first"

alias la="ls -la"

alias em="emacsclient -c"

alias cam="mpv av://v4l2:/dev/video0"

# Add devouring support in zsh
function devour {
	id=$(xdo id)
	xdo hide
	$@
	xdo show "$id"
}

alias mpv="devour mpv"
alias zathura="devour zathura"

# Enable syntax highlighting
# Always load this last
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
