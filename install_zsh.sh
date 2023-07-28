#!/bin/bash
#
# Do it before lunching script:
# chmod +x <script_name>.sh
#
# For the root lunch:
# sudo ./<script_name>.sh

if [ "$SHELL" = "/bin/zsh"]; then
    echo "zsh is installed"
else
    echo "Installing zsh..."
    if [ "$(uname)" = "Linux" ]; then
        sudo apt update && sudo apt install -y zsh
        sudo chsh -s "/bin/zsh"
        echo "The default shell has been changed to zsh."
    elif [ "$(uname)" = "Darwin" ]; then
        brew update && brew install zsh
        sudo chsh -s "/bin/zsh"
        echo "The default shell has been changed to zsh."
    else
        echo "Unsupported OS!"
        exit 1
    fi
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh-My-Zsh!"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh-My-Zsh! is installed"
fi

