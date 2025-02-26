# ========================
# AMAZON Q PRE-BLOCK
# ========================
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"


# ========================
# OH-MY-ZSH SETUP
# ========================

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Set list of themes to load
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 14

# Enable command auto-correction and automatic directory change
setopt correct
setopt autocd

setopt prompt_subst

# Shows the full command that will be executed in italics
preexec() {
    local cmd=${1%% *}
    local expanded=$(alias "$cmd" 2>/dev/null)
    if [[ -n $expanded ]]; then
        print -P "\e[3m$expanded\e[0m\n"
    fi
}

# Enable visual feedback during command completion
COMPLETION_WAITING_DOTS="true"

# Enable plugins
plugins=(
    git
    gitignore
    pip
    python
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh


# ========================
# OS-SPECIFIC CONFIGURATIONS
# ========================

# Check OS and set aliases
if [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
  # { eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_ed25519; } &>/dev/null # Start SSH agent & add SSH key if running in WSL
  eval "$(ssh-agent -s)" &>/dev/null
  ssh-add ~/.ssh/id_dev_wsl &>/dev/null
  ssh-add ~/.ssh/id_prod_wsl &>/dev/null
  ssh-add ~/.ssh/id_personal_wsl &>/dev/null
  ssh-add -l &>/dev/null || {
        echo "Проблема с загрузкой SSH-ключей"
    }
  alias bat='batcat' # batcat alias
  export PATH="$PATH:/snap/bin" # Add snap to PATH
  alias btm='bottom' # bottom alias
  TELEGRAM_PATH='C:\\Users\\tropin\\AppData\\Roaming\\Telegram Desktop\\Telegram.exe'
  alias telegram="powershell.exe -Command \"Start-Process '$TELEGRAM_PATH'\""
elif [ "$OSTYPE" = "linux-gnu" ]; then
  alias bat='batcat' # batcat alias
  export PATH="$PATH:/snap/bin" # Add snap to PATH
  alias btm='bottom' # bottom alias
elif [[ "$OSTYPE" == darwin* ]]; then
  export PATH="$PATH:/Applications/Zed.app/Contents/MacOS" # Add Zed to PATH
  alias zed='open -a "Zed"' # Zed alias
  eval "$(fzf --zsh)" # fzf key bindings

fi


# ========================
# PYTHON & PACKAGE MANAGEMENT
# ========================

# pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# pyenv-virtualenv setup
eval "$(pyenv virtualenv-init -)"

# Python aliases
alias python="python3"
alias update-pip-list="~/all_my_settings/update_pip_modules.sh"


# ========================
# DEVELOPMENT TOOLS
# ========================

# Racket
if [ -d "/Applications/Racket v8.10/bin" ]; then
  export PATH="/Applications/Racket v8.10/bin:$PATH"
fi

# Add Rust to PATH
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# NVM setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# ========================
# PREFERENCES & ALIASES
# ========================

# Preferred editor for local and remote sessions
export EDITOR=$([[ -n $SSH_CONNECTION ]] && echo 'vim' || echo 'nvim') # SSH: vim, Local: nvim

# Right prompt (time)
RPROMPT='%*'  # Time in 24-hour format

# Aliases
alias c='clear'

alias l='ls -laFh --color=always | less -FRX' # List all files with color and less

alias settings='cd ~/all_my_settings'
alias imandra='cd ~/imandra_guide_bot && gpr && code .'

alias tmks='tmux kill-server' # Kill the server
alias tmk='tmux kill-session -t' # Hint: tmk <session_name>
alias tmatmn='tmux attach || tmux new' # Attach to the last session or create a new one
alias tma='tmux attach' # Attach to the last session
alias tmls='tmux list-sessions' # List all sessions
alias tmn='tmux new' # Create a new session


# ========================
# AMAZON Q POST-BLOCK
# ========================
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
