#!/usr/bin/env zsh
echo "\nSetting up Homebrew...\n"

# install brew and brew packages
if exists brew; then
  echo "\nBrew exists, skipping install\n"
else
  echo "\nInstalling Brew\n"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew bundle --verbose

# install oh-my-zsh
if [ ! -d ~/.local/share/zinit ]; then
    echo "\nSetting up zinit...\n"
    /bin/bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
else
    echo "\nzinit already installed\n"
fi
echo "$PROMPT Please Close and restart Terminal to use Zsh"
