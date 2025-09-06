# ~/.zshrc — Clean, optimized for Arch + mise + fyv

# ----------------------------
# 🧰 PATH & ENV
# ----------------------------

# Add ~/bin to PATH
export PATH="$HOME/bin:$PATH"

# Prefer user-installed binaries over system
export PATH="$HOME/.local/bin:$PATH"

# ----------------------------
# 🎨 PROMPT
# ----------------------------

# Simple, clean, colored prompt: [user@host] cwd $
setopt PROMPT_SUBST
autoload -U colors && colors
PS1="%{$fg[cyan]%}[%n@%m%{$reset_color%}%{$fg[yellow]%}] %~ %{$reset_color%}%% "

# ----------------------------
# 💡 ALIASES
# ----------------------------

alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Quick edits
alias vim='nvim'          # if you use neovim
alias vi='nvim'
alias edit='nvim'

# System
alias reboot='sudo reboot'
alias shutdown='sudo shutdown -h now'

# ----------------------------
# 🧩 MISE (Version Manager)
# ----------------------------

# Initialize mise (formerly rtx)
eval "$(mise activate zsh)"

# Optional: Set default tools (if not in .mise.toml)
# mise global node@lts
# mise global python@3.12

# ----------------------------
# 🔍 COMPLETIONS
# ----------------------------

# Enable completion
autoload -U compinit
compinit

# fyv completions (basic file completion for -flist)
_fyv() {
    _files -g "*.txt"
}
compdef _fyv fyv

# ----------------------------
# 📜 HISTORY
# ----------------------------

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_all_dups inc_append_history

# ----------------------------
# 🚀 MISC OPTIMIZATIONS
# ----------------------------

# Auto-correct (optional — disable if annoying)
# setopt correct_all

# Enable interactive comments (use # in command line)
setopt interactive_comments

# Case-insensitive globbing
unsetopt CASE_GLOB

# ----------------------------
# 🎉 WELCOME MESSAGE (Optional)
# ----------------------------

# Uncomment if you want a greeting
# echo "Welcome back, $(whoami) 🚀"
# echo "→ $(date)"
# echo "→ Packages logged: $(wc -l < ~/pkglist.txt 2>/dev/null || echo 0)"
