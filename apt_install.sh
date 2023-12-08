#!/usr/bin/env bash

#Fix NameServer In WSL
chattr -i /etc/resolv.conf
rm /etc/resolv.conf
#truncate -s 0 /etc/resolv.conf
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "[network]" > /etc/wsl.conf
echo "generateResolvConf = false" >> /etc/wsl.conf
chattr +i /etc/resolv.conf
# Update apt
apt-add-repository ppa:fish-shell/release-3
apt update -y

# Upgrade any preinstalled packages
apt upgrade -y

apt install fish -y
# ---------------------------------------------
# Programming Languages and Frameworks
# ---------------------------------------------

apt install -y git \
              httpie \
              tree \
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
              fuse \
              fd-find \
              lua5.4 \
              luarocks \
              libpng-dev \
              libjpeg-dev \
              libtiff-dev \
              libgif-dev \
              libfreetype6-dev \
              liblcms2-dev \
              libxml2-dev

echo $(which fish) | tee -a /etc/shells


usermod --shell /usr/bin/fish $USER

if command -v google-chrome-stable >/dev/null 2>&1; then
    echo "Chrome already installed."
else
    curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o "google-chrome_stable_current_amd64.deb"
    dpkg -i google-chrome_stable_current_amd64.deb
    apt install -f -y #install dependencies
fi

if command -v aws >/dev/null 2>&1; then
    echo "The aws command exists, assuming ssm is also installed"
else

    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    unzip awscliv2.zip
    ./aws/install
    curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb"
    dpkg -i session-manager-plugin.deb
fi


curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& apt update \
&& apt install gh -y


if command -v lazygit>/dev/null2>&1; then
    echo "Lazygit already installed"
else
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
fi
