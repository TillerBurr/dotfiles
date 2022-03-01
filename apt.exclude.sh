#!/usr/bin/env bash

# Install my favourite tools using the apt package manager (currently tested only on Debian buster)

PROMPT='[apt-install]'

echo "$PROMPT I hope you're running this script as root!"


# Update apt
apt update -y

# Upgrade any preinstalled packages
apt upgrade -y


# ---------------------------------------------
# Programming Languages and Frameworks
# ---------------------------------------------

# NodeJS
apt install nodejs -y
apt install yarn -y
# Golang
#add-apt-repository ppa:longsleep/golang-backports
# apt install golang-go -y
# Python
apt install python3.7
apt install python3.8
apt update -y



# ---------------------------------------------
# Tools I use often
# ---------------------------------------------

# Git, obviously
apt install git -y


apt install apt-transport-https ca-certificates curl software-properties-common -y


# Docker Compose
#apt install docker-compose -y

# Vim B)
apt install vim -y

# Make requests with awesome response formatting
apt install httpie -y

# Show directory structure with excellent formatting
apt install tree -y

# tmux :'D
apt install tmux -y


# ---------------------------------------------
# Misc
# ---------------------------------------------

# Zsh
apt install zsh -y
chsh -s $(which zsh)

# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


sudo apt-get update; sudo apt-get install make build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
# My favorite text editor: VS Code
# Installation instructions: https://code.visualstudio.com/docs/setup/linux
# curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
# install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
# sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
# apt install apt-transport-https -y
# apt update
# apt install code -y
# echo "$PROMPT VS Codes adds some GPG key during its install. Removing it!"
# rm packages.microsoft.gpg

# ---------------------------------------------
# Terminal gimmicks xD
# ---------------------------------------------

# The computer fortune teller
apt install fortune -y

# The famous cowsay
apt install cowsay -y

# Multicolored text output -y
apt install lolcat -y
apt install fzy

# Cleanup the cache (TODO: set up a cron to do this)
apt clean

curl -LSfs https://raw.githubusercontent.com/cantino/mcfly/master/ci/install.sh | sh -s -- --git cantino/mcfly
echo "$PROMPT Please Close and restart Terminal to use Zsh"
