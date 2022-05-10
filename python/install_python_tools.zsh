#! /usr/bin/zsh

# set GLOBAL_PY to the Python version you want to use globally
GLOBAL_PY="3.10.4"

echo "Installing poetry"
curl -sSL https://install.python-poetry.org | python3 - --preview


export PATH="${HOME}/.local/bin:$PATH"

poetry config virtualenvs.create true
poetry config virtualenvs.in-project true

if [ ! -d ~/.pyenv ]; then
    echo "\nInstalling pyenv...\n"
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    # uncomment lines below for installing pyenv via pyenv-installer script
    # brew install openssl readline sqlite3 xz zlib
    # curl https://pyenv.run | bash
else
    echo "\npyenv already installed\n"
fi

# check if pyenv executable is added to the PATH and shims are enabled
if ! exists pyenv; then
    echo "\nadding pyenv executable to the PATH\n"
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
fi
if ! echo $PATH | grep --color=auto "$(pyenv root)/shims" > /dev/null 2>&1; then
    echo "\nadding pyenv shims directory to the PATH\n"
    eval "$(pyenv init --path)"
fi

if ! pyenv versions | grep $GLOBAL_PY > /dev/null 2>&1; then
    echo "\nInstalling Python $GLOBAL_PY via pyenv\n"
    pyenv install $GLOBAL_PY
else
    echo "\nPython $GLOBAL_PY already installed via pyenv\n"
fi


# set up global Python version via pyenv
if ! pyenv global | grep $GLOBAL_PY > /dev/null 2>&1; then
    echo "\nSetting up Python $GLOBAL_PY as the global version via pyenv\n"
    pyenv global $GLOBAL_PY
else
    echo "\nPython $GLOBAL_PY already set up as the global version via pyenv\n"
fi


PY="$(python --version)"
if [ "$PY" = "Python $GLOBAL_PY" ]; then
    echo "\nPython $GLOBAL_PY set up correctly\n"
else
    echo "\nWarning: Python $GLOBAL_PY is NOT set up correctly, still using system version: $PY\n"
fi


# install pipx and pipx packages
if ! brew ls --versions pipx > /dev/null 2>&1; then
    echo "\nInstalling pipx...\n"
    brew install pipx
else
    echo "\npipx already installed\n"
fi

# install pipx and pipx packages
if ! brew ls --versions pipx > /dev/null 2>&1; then
    echo "\nInstalling pipx...\n"
    brew install pipx
else
    echo "\npipx already installed\n"
fi

echo "\nInstalling pipx packages for Python $GLOBAL_PY...\n"
PIPX_LIST="$(pipx list)"
GLOBAL_PY_PATH="$(pyenv which python)"

while read -r P; do
    if [[ $(echo "$PIPX_LIST" | grep -ce "package $P .*, Python $GLOBAL_PY") -gt 0 ]]; then
        echo "$P already installed."
    elif [[ $(echo "$PIPX_LIST" | grep -ce "package $P") -gt 0 ]]; then
        echo "Reinstalling $P for $GLOBAL_PY."
        pipx uninstall "$P" && pipx install --python $GLOBAL_PY_PATH "$P"
    else
        pipx install "$P"
    fi
done <"$HOME/.dotfiles/python/pipx-requirements.txt"
