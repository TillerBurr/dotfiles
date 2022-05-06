# My Dotfiles

Dotfiles for Ubuntu, including:

- pyenv
- pipx
- zinit
- dotbot
- homebrew
- yarn
- vim
- nodejs

## Setting up

1. Generate a new public and private SSH key and add them to Github
2. `git clone git@github.com:baurt/dotfiles.git ~/.dotfiles`
3. Review `apt_install.sh`
4. Review `Brewfile`
5. Review `python/pipx-requirements.txt`
6. Set `GLOBAL_PY` in `python/install_python_tools.zsh` to the Python version you want to set as a pyenv global
7. Run `sudo ./install-sudo`
8. Run `./install`

## Maintenance

- update Brewfile with `brew bundle dump --force --describe`

### Inspiration (and heavily borrowed from)

- [izabelakowal/dotfiles)](https://github.com/izabelakowal/dotfiles)
