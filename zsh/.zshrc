# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =============================================================================
# Environment Variables & PATH
# =============================================================================
export EDITOR='nvim'

# PATH
export PATH="${HOME}/.local/bin:$PATH"
export PATH="/usr/local/go/bin:$PATH"
export PATH="${HOME}/go/bin:$PATH"
export PATH="/usr/local/zig:$PATH"

# =============================================================================
# History Configuration
# =============================================================================
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=100000
export HISTORY_IGNORE='(ls|ll|cd|pwd|exit)*'

setopt EXTENDED_HISTORY      # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY    # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY         # Share history between all sessions.
# setopt HIST_IGNORE_DUPS      # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS  # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_SPACE     # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS     # Do not write a duplicate event to the history file.
setopt HIST_VERIFY           # Do not execute immediately upon history expansion.
# setopt APPEND_HISTORY        # append to history file (Default)
setopt HIST_NO_STORE         # Don't store history commands
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line being added.
setopt INTERACTIVE_COMMENTS  # Allow the use of # on the command line

# =============================================================================
# Keybindings (Vi Mode)
# =============================================================================
autoload -z edit-command-line
zle -N edit-command-line
bindkey -v
bindkey '^?' backward-delete-char
bindkey -M vicmd 'V' edit-command-line
export KEYTIMEOUT=1 # Remove Esc key delay for vi mode

# =============================================================================
# Aliases & Functions
# =============================================================================
alias hr='printf "%*s\n" "${COLUMNS:-$(tput cols)}" "" | tr " " -'
alias lg='lazygit'
alias ll='eza -lh --group-directories-first --icons'
alias ls='eza'
alias tree='eza --tree'
alias tf='terraform'
alias bat='batcat -p'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias shortdate="date '+%Y_%m_%d'"
alias n='nvim'
alias g='git'
alias tmp='cd $(mktemp -d)'

gcb () { git checkout -b "${1}" && git push -u origin "${1}" }
gcm () { git checkout master && git pull } # Change 'master' to 'main' if needed
notify () { printf "\\x1b]99;;${1}\\x1b\\\\" } # Kitty desktop notifications

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# =============================================================================
# Completions (Ubuntu Recommended + Custom)
# =============================================================================
setopt EXTENDED_GLOB # Ensure extended globbing is on for the (#q...) syntax

autoload -Uz compinit

if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh-24) ]]; then
  compinit -C
else
  compinit
fi

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# External tool integrations
eval "$(fzf --zsh)"
eval "$(op completion zsh)"; compdef _op op

# =============================================================================
# Zsh Plugins & Themes
# =============================================================================
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
