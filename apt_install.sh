#!/usr/bin/env bash

# Update apt
apt-add-repository ppa:fish-shell/release-3
apt update -y

# Upgrade any preinstalled packages
apt upgrade -y

apt install fish -y
# ---------------------------------------------
# Programming Languages and Frameworks
# ---------------------------------------------

# NodeJS
apt install -y nodejs \
              yarn \
              git \
              httpie \
              tree \
              zsh \
              ccze \
              libgit2-dev \
              fzf \
              make \
              apt-transport-https \
              ca-certificates \
              software-properties-common\
              make \
              gcc \
              libpq-dev \
              build-essential \
              libssl-dev \
              zlib1g-dev \
              libbz2-dev \
              libreadline-dev \
              libsqlite3-dev \
              wget \
              bat \
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
              unzip \
              pinentry-gtk2 \
              fuse

echo $(which fish) | tee -a /etc/shells

# chsh -s $(which zsh)
echo $(which fish)
chsh -s $(which fish)

curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o "google-chrome_stable_current_amd64.deb"
apt -y install ./google-chrome-stable_current_amd64.deb

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install -y

curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
dpkg -i session-manager-plugin.deb

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& apt update \
&& apt install gh -y

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin