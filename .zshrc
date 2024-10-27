# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 2 numeric
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/home/chris/.zshrc'

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# setopt autocd

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="frontcube" # best: frontcube, intheloop, refined | good: murilasso, strug | other: peepcode, sporty_256
plugins=(git npm zsh-autosuggestions zsh-syntax-highlighting fzf-tab)
source $ZSH/oh-my-zsh.sh

autoload -Uz compinit
compinit

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# common aliases
alias c='clear'
alias ll='ls -al'
alias la='ls -a'
alias copy="xsel -b -i"
alias paste="xsel -b -o"
alias gcaam='git add -A && git commit -m'
alias sudogp="sudo SSH_AUTH_SOCK="$SSH_AUTH_SOCK" git push"

# pacman aliases
alias clean="yay -Sc"
alias deepclean="yay -Qtdq | yay -Rns -"
alias installed="pacman -Qqe"
alias yeet="yay -Rns"
alias hmmm="yay -Sy &> /dev/null && yay -Qu"

# oh my zsh aliases
alias aliasg='alias | grep'
alias aliasgit='alias | grep git'
alias aliasnpm='alias | grep npm'

# specific tools aliases
alias ai='ollama run llama3.2:3b'
alias ai-code="ollama run deepseek-coder-v2:16b"
alias backg='nitrogen --restore'
alias onlykey="/opt/OnlyKey/nw"
alias dockerstop="docker stop \$(docker ps -q)"
alias hybrid="supergfxctl -m Hybrid && xfce4-session-logout --logout --fast"
alias integrated="supergfxctl -m Integrated && xfce4-session-logout --logout --fast"

# remember fixes
alias fixlight="asusctl led-pow-2 keyboard --awake"
alias grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias mkinit="sudo mkinitcpio -P"

# scripts
alias dev="./scripts/open-git-folder.sh"
alias saver="asusctl profile -P Quiet && sudo systemctl stop ollama"
alias deepsaver="saver && sudo pkill picom && sudo pkill blueman && sudo systemctl stop tailscaled"

eval "$(fzf --zsh)"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
