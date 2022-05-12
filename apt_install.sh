#!/usr/bin/env bash

# Install my favourite tools using the apt package manager (currently tested only on Debian buster)

PROMPT='[apt-install]'

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
# Update apt
apt update -y

# Upgrade any preinstalled packages
apt upgrade -y


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
              zsh



chsh -s $(which zsh)


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
