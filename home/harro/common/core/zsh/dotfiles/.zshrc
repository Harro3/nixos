# Zinit home var
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Install zinit if not installed
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# load zinit
source "${ZINIT_HOME}/zinit.zsh"


# Add plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

# OMZ snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found
zinit snippet OMZP::docker-compose
# zinit snippet OMZP::tmux
zinit snippet OMZP::fancy-ctrl-z


# Load completions
autoload -U compinit && compinit
zinit cdreplay -q

# Keybinds
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey -r '^[x'

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# Fzf tab styling
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa --icons --color=always $realpath'

# Aliases
alias l='exa -lah --color=always --group-directories-first --icons'
alias la='exa -al --color=always --group-directories-first --icons'
alias ll='exa -l --color=always --group-directories-first --icons'
alias ls='exa --icons'
alias vim='nvim'
alias cs="vim ~/.cheatsheet.md"

# Shell integrations
eval "$(fzf --zsh)"

# Zoxide
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'exa --icons --color=always $realpath'
eval "$(zoxide init --cmd cd zsh)"

# Set env vars
export EDITOR="nvim"

PATH=~/.console-ninja/.bin:$PATH

# pip packages
PATH="$HOME/.local/bin:$PATH"

# CUDA
PATH="/opt/cuda/bin:$PATH"

# Cargo
PATH="$HOME/.cargo/bin:$PATH"

# Better pkill
pkill ()
{
    ps aux | fzf --height 40% --layout=reverse --prompt="Select process to kill: " | awk '{print $2}' | xargs -r sudo kill
}


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/harro/.opam/opam-init/init.zsh' ]] || source '/home/harro/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

# SQL Workshop
export PGDATA="$HOME/postgres_data"
export PGHOST="/tmp"

eval "$(starship init zsh)"

if command -v direnv > /dev/null 2>&1; then
  eval "$(direnv hook zsh)"
fi

if command -v sesh > /dev/null 2>&1; then
  alias s='sesh cn $(sesh l -ctzdi | fzf --ansi)'
fi
