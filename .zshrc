# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Change the auto-update behavior:
# disabled  # disable automatic updates
# auto      # update automatically without asking
# reminder  # just remind me to update when it's time
zstyle ':omz:update' mode auto

# Change how often to auto-update (in days).
zstyle ':omz:update' frequency 14

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/gitignore
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/pip
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/python
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/web-search
# https://github.com/zsh-users/zsh-autosuggestions
#
plugins=(
    git
    gitignore
    pip
    python
    web-search
    you-should-use
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# USER CONFIGURATION
echo "Hello, $USER! Today is: $(date)\n"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nano'
fi

# Set time for the right prompt
RPROMPT='%*'

# Settings for the zsh-you-should-use plugin:
export YSU_MODE=ALL

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Config aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias bashconfig="vim ~/.bashrc"
alias gitconfig="vim ~/.gitconfig"
alias tmuxconfig="vim ~/.tmux.conf"

# batcat alias for Linux
if [ "$OSTYPE" = "linux-gnu" ]; then
    alias bat='batcat'
fi

# Bottom PATH and alias
if [ "$OSTYPE" = "linux-gnu" ]; then
  export PATH="$PATH:/snap/bin"
  alias btm='bottom'
fi

# Git aliases
alias GS='git status'
alias GSW='git swich'
alias GP='git push'
alias GF='git fetch'
alias GPR='git pull --rebase'
alias GA='git add'
alias GC='git commit'
alias GCM='git commit -m'

# ls alias
alias l='ls -laF'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# pyenv-virtualenv
eval "$(pyenv virtualenv-init -)"

# Python aliases
echo 'Python versions in /usr/bin/:'
l /usr/bin/ | grep -E -o 'python[[:digit:]]\.[[:digit:]]{2}' | sort -u
echo 'Python versions in /usr/local/bin:'
l /usr/local/bin | grep -E -o 'python[[:digit:]]\.[[:digit:]]{2}' | sort -u
echo 'Python versions in ~/.pyenv/versions/:'
l ~/.pyenv/versions/ | grep -E -o '[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+' | sort -u
echo ''
echo "Pyenv global version of Python is: $(pyenv which python | grep -E -o '[[:digit:]]+\.[[:digit:]]+\.[[:digit:]]+')"
echo ''

alias python="python3"
alias update-pip-list="~/all_my_settings/update_pip_modules.sh"

# Tmux aliases
alias TMKS='tmux kill-server'
alias TMK='tmux kill-session -t'
alias TMATMN='tmux attach || tmux new'
alias TMA='tmux attach'
alias TMN='tmux new'

# Racket
export PATH="/Applications/Racket v8.10/bin:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Verifies if running inside WSL;
# if true, starts the SSH agent and adds the SSH key to it.
if [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
    echo "Running inside WSL"
    eval "$(ssh-agent -s)"
    echo "SSH agent started"
    ssh-add ~/.ssh/id_ed25519
    echo "SSH key added"
fi

# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
