# Created by newuser for 5.9

# Znit and plugins directory
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

#Download Zinit if it's not there
if [ ! -d "$ZINIT_HOME" ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

#Source/load Zinit
source "${ZINIT_HOME}/zinit.zsh"

#Zinit plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab


#Load Completions
autoload -Uz compinit && compinit

# Completion Styling
zstyle 'completions:*' matcher-list 'm{a-z}={A-Za-Z}'
zstyle 'completions:*' list-colors "${(s.:.)LS_COLORS}"
zstyle 'completion:*' menu no
zstyle 'completion:__zoxide_z:*' fzf-preview 'ls --color $realpath' 

#Loads Oh-my-posh config
eval "$(oh-my-posh init zsh --config ~/.config/omp/config.toml)"


# History
HISTSIZE=1000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUPE=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


#Shell Integrations
# Source fzf key bindings and completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(fzf --zsh)"
# Load Zoxide into zsh
eval "$(zoxide init zsh)"

#Aliases
alias ll='ls --color -l'
alias ls='lsd -la'
alias la='ls --color -l -a'
alias tt='tree -C'
alias ta='tree -aC'
alias cd='z'


alias timeshift='pkexec env DISPLAY=$DISPLAY WAYLAND_DISPLAY=$WAYLAND_DISPLAY XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR DBUS_SESSION_BUS_ADDRESS=$DBUS_SESSION_BUS_ADDRESS timeshift-gtk >/dev/null &'

# Custom widget for "select all"
zle-select-all() {
  BUFFER=$(cat) # Replace the command line buffer with all input (simulate "select all")
  zle end-of-line # Move the cursor to the end of the line
}
zle -N zle-select-all
bindkey '^A' zle-select-all


