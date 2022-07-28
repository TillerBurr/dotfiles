#! /usr/bin/zsh

# set GLOBAL_PY to the Python version you want to use globally
GLOBAL_PY="3.10.4"
ASDF_BRANCH=v0.10.2
POETRY_VERSION=1.2.0b3


ASDF_OR_PYENV="asdf"

if [ "$ASDF_OR_PYENV"="pyenv" ]; then
    if [ ! -d ~/.pyenv ]; then
        echo "\nInstalling pyenv...\n"
        git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    else
        echo "\npyenv already installed\n"
    fi

    # check if pyenv executable is added to the PATH and shims are enabled
    if ! type pyenv >/dev/null 2>&1; then
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


else


    if [ ! -d ~/.asdf ]; then
        echo "\nInstalling asdf...\n"
        git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch $ASDF_BRANCH
    else
        echo "\nasdf already installed\n"
    fi


    # check if pyenv executable is added to the PATH and shims are enabled
    if ! type asdf > /dev/null 2>&1; then
        echo "\nadding asdf executable to the PATH\n"
        . $HOME/.asdf/asdf.sh
    fi

    if ! asdf plugin list|grep python> /dev/null 2>&1; then
        echo "\nadding asdf plugin for python\n"
        asdf plugin-add python
    fi

    if ! asdf list python | grep $GLOBAL_PY > /dev/null 2>&1; then
        echo "\nInstalling Python $GLOBAL_PY via asdf\n"
        asdf install python $GLOBAL_PY
    else
        echo "\nPython $GLOBAL_PY already installed via asdf\n"
    fi


    if ! asdf list python | grep $GLOBAL_PY > /dev/null 2>&1; then
        echo "\nInstalling Python $GLOBAL_PY via asdf\n"
        asdf install python $GLOBAL_PY
    else
        echo "\nPython $GLOBAL_PY already installed via asdf\n"
    fi


    # set up global Python version via asdf
    if ! cat ~/.tool-versions | grep $GLOBAL_PY > /dev/null 2>&1; then
        echo "\nSetting up Python $GLOBAL_PY as the global version via asdf\n"
        asdf global python $GLOBAL_PY
    else
        echo "\nPython $GLOBAL_PY already set up as the global version via asdf\n"
    fi



fi
    PY="$(python --version)"
    if [ "$PY" = "Python $GLOBAL_PY" ]; then
        echo "\nPython $GLOBAL_PY set up correctly\n"
    else
        echo "\nWarning: Python $GLOBAL_PY is NOT set up correctly, still using system version: $PY\n"
    fi
export PATH="${HOME}/.local/bin:$PATH"

echo "Installing poetry"
if ["$ASDF_OR_PYENV"="pyenv"]; then

    curl -sSL https://install.python-poetry.org | python - --preview

else

    asdf plugin-add poetry https://github.com/asdf-community/asdf-poetry.git
    asdf install poetry $POETRY_VERSION
fi

poetry config virtualenvs.create true
poetry config virtualenvs.in-project true


# install pipx and pipx packages
if ! type pipx > /dev/null 2>&1; then
    echo "\nInstalling pipx...\n"
    python -m pip install --user  pipx
    python -m pipx ensurepath
else
    echo "\npipx already installed\n"
fi


echo "\nInstalling pipx packages for Python $GLOBAL_PY...\n"
PIPX_LIST="$(pipx list)"
if [ "$ASDF_OR_PYENV"=="pyenv" ]; then
    GLOBAL_PY_PATH="$(pyenv which python)"
else
    GLOBAL_PY_PATH="$(asdf which python)"
fi

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
