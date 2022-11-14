# My Dotfiles

Dotfiles for Ubuntu, including:

- pyenv/asdf
- pipx
- zsh with zinit
- fish
- dotbot
- vim

## Setting up

1. Generate a new public and private SSH key and add them to Github
2. `git clone git@github.com:baurt/dotfiles.git ~/.dotfiles`
3. Review `apt_install.sh`
4. Review `python/pipx-requirements.txt`
5. Set `GLOBAL_PY` in `python/install_python_tools.zsh` to the Python version you want to set as a pyenv/adsf global
6. Run `sudo ./install-sudo`
7. Run `./install`

### Inspiration (and heavily borrowed from)

- [izabelakowal/dotfiles)](https://github.com/izabelakowal/dotfiles)
