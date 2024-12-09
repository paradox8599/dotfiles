export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1
export DOCKER_DEFAULT_PLATFORM=linux/amd64
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.bun/bin"
# psql
export PATH="$PATH:$HOMEBREW_PREFIX/opt/postgresql@16/bin"

alias ta="tmux -u attach -t"
alias tn="tmux -u new -s"
alias t='[[ $(tmux ls 2>/dev/null | rg -v attached | wc -l) -gt 0 ]] && tmux attach -t $(tmux ls | rg -v attach | cut -d":" -f1 | tr "\n" " " | cut -d" " -f1) || tmux'
alias tl='tmux ls 2>/dev/null'

alias python="python3"
alias py="python3"

alias ldk="lazydocker"
alias dk="docker"
alias dkc="docker compose"

alias gdu=gdu-go
alias vim=nvim
alias vi=nvim
alias vic="nvim --clean"
alias lg=lazygit
alias lgd="lazygit -w $HOME -g $HOME/.paragit"
alias gitd='git --git-dir=$HOME/.paragit --work-tree=$HOME'
alias ii="open"
alias i=""
alias l="eza --long --icons --sort=type --group"
alias ll="l --header"
alias la="l --all"

alias http="python -m http.server"

# # init
# eval $(thefuck --alias)
eval "$(vfox activate zsh)"

# zoxide
eval "$(zoxide init zsh)"
alias j=z
alias ji=zi

# Yazi
export EDITOR=nvim
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# zimfw
source "$HOME/.zim.zshrc"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# starship
eval "$(starship init zsh)"
