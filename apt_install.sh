#!/usr/bin/env bash

# Install my favourite tools using the apt package manager (currently tested only on Debian buster)

PROMPT='[apt-install]'

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
# Update apt
apt-add-repository ppa:fish-shell/release-3
apt update -y

# Upgrade any preinstalled packages
apt upgrade -y

apt install fish
# ---------------------------------------------
# Programming Languages and Frameworks
# ---------------------------------------------

# NodeJS
apt install -y nodejs \
              yarn \
              git \
              neovim \
              httpie \
              tree \
              zsh \
              ccze \
              libgit2-dev \
              fzf




apt install -y apt-transport-https \
            ca-certificates \
            software-properties-common\
            make \
            build-essential \
            libssl-dev \
            zlib1g-dev \
            libbz2-dev \
            libreadline-dev \
            libsqlite3-dev \
            wget \
            curl \
            llvm \
            libncursesw5-dev \
            xz-utils \
            tk-dev \
            libxml2-dev \
            libxmlsec1-dev \
            libffi-dev \
            liblzma-dev \
            file \
            pinentry-gtk-2

echo $(which fish) | tee -a /etc/shells

# chsh -s $(which zsh)

chsh -s $(which fish)
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -y -f
