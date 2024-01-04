# My Dotfiles

Dotfiles for Ubuntu, including:

- mise
    - python
    - rust
    - nodejs via nvm
- pipx
- fish
- dotbot
- neovim

## Setting up
1. Clone this repo via SSH or HTTP
    - SSH
        1. Generate a new public and private SSH key and add them to Github
        2. `git clone git@github.com:TillerBurr/dotfiles.git ~/.dotfiles`
    - HTTP
        1. `git clone https://github.com/TillerBurr/dotfiles.git ~/.dotfiles`
3. Review `apt_install.sh`
4. Review `python/pipx-requirements.txt`
5. Run `./install`
6. Make sure the shell is fish. May have to change via `chsh -s /usr/bin/fish`
7. Generate a new GPG key and edit `~/.gitconfig.local` and replace `signingkey`
8. If using in WSL, install Wezterm.
    1. Install wezterm via

        ```commandline
        winget install wezterm
        ```

        or

        ```commandline
        choco install wezterm
        ```





## TODO

1. Secrets. Best method? Ansible Vault? GPG?
