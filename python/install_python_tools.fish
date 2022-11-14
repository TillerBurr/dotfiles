#! /usr/bin/fish

# set GLOBAL_PY to the Python version you want to use globally
set GLOBAL_PY="3.11.0"
set ASDF_BRANCH=v0.10.2
set POETRY_VERSION=1.2.2
set PDM_VERSION="latest"


set ASDF_OR_PYENV="asdf"

if test "$ASDF_OR_PYENV"="pyenv"
    if not test -d ~/.pyenv
        echo "\nInstalling pyenv...\n"
        git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    else
        echo "\npyenv already installed\n"
    end

    # check if pyenv executable is added to the PATH and shims are enabled
    if not type -q pyenv >/dev/null 2>&1
        echo "\nadding pyenv executable to the PATH\n"
        export PYENV_ROOT="$HOME/.pyenv"
        export PATH="$PYENV_ROOT/bin:$PATH"
    end
    if not echo $PATH | grep --color=auto "$(pyenv root)/shims" >/dev/null 2>&1
        echo "\nadding pyenv shims directory to the PATH\n"
        eval "$(pyenv init --path)"
    end

    if not pyenv versions | grep $GLOBAL_PY >/dev/null 2>&1

        echo "\nInstalling Python $GLOBAL_PY via pyenv\n"
        pyenv install $GLOBAL_PY
    else
        echo "\nPython $GLOBAL_PY already installed via pyenv\n"
    end


    # set up global Python version via pyenv
    if not pyenv global | grep $GLOBAL_PY >/dev/null 2>&1
        then
        echo "\nSetting up Python $GLOBAL_PY as the global version via pyenv\n"
        pyenv global $GLOBAL_PY
    else
        echo "\nPython $GLOBAL_PY already set up as the global version via pyenv\n"
    end


else


    if not test -d ~/.asdf
        echo "\nInstalling asdf...\n"
        git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch $ASDF_BRANCH
    else
        echo "\nasdf already installed\n"
    end


    # check if pyenv executable is added to the PATH and shims are enabled
    if not type -q asdf >/dev/null 2>&1

        echo "\nadding asdf executable to the PATH\n"
        . $HOME/.asdf/asdf.sh
    end

    if not asdf plugin list | grep python >/dev/null 2>&1
        echo "\nadding asdf plugin for python\n"
        asdf plugin-add python
    end

    if not asdf list python | grep $GLOBAL_PY >/dev/null 2>&1
        echo "\nInstalling Python $GLOBAL_PY via asdf\n"
        asdf install python $GLOBAL_PY
    else
        echo "\nPython $GLOBAL_PY already installed via asdf\n"
    end


    if not asdf list python | grep $GLOBAL_PY >/dev/null 2>&1
        echo "\nInstalling Python $GLOBAL_PY via asdf\n"
        asdf install python $GLOBAL_PY
    else
        echo "\nPython $GLOBAL_PY already installed via asdf\n"
    end


    # set up global Python version via asdf
    if not cat ~/.tool-versions | grep $GLOBAL_PY >/dev/null 2>&1
        echo "\nSetting up Python $GLOBAL_PY as the global version via asdf\n"
        asdf global python $GLOBAL_PY
    else
        echo "\nPython $GLOBAL_PY already set up as the global version via asdf\n"
    end



end
set PY="$(python --version)"
if [ "$PY" = "Python $GLOBAL_PY" ]
    echo "\nPython $GLOBAL_PY set up correctly\n"
else
    echo "\nWarning: Python $GLOBAL_PY is NOT set up correctly, still using system version: $PY\n"
end
set -x PATH="$HOME/.local/bin:$PATH"

echo "Installing poetry and pdm"
if test "$ASDF_OR_PYENV"="pyenv"

    curl -sSL https://install.python-poetry.org | python - --preview

else

    asdf plugin-add poetry https://github.com/asdf-community/asdf-poetry.git
    asdf install poetry $POETRY_VERSION
    asdf plugin add pdm
    asdf install pdm $PDM_VERSION
end

poetry config virtualenvs.create true
poetry config virtualenvs.in-project true


# install pipx and pipx packages
if not type -q pipx >/dev/null 2>&1
    echo "\nInstalling pipx...\n"
    python -m pip install --user pipx
    python -m pipx ensurepath
else
    echo "\npipx already installed\n"
end


echo "\nInstalling pipx packages for Python $GLOBAL_PY...\n"
set PIPX_LIST="$(pipx list)"
if [ "$ASDF_OR_PYENV"=="pyenv" ]
    set GLOBAL_PY_PATH="$(pyenv which python)"
else
    set GLOBAL_PY_PATH="$(asdf which python)"
end

while read -r P
    do
    set inst echo "$PIPX_LIST" | grep -ce "package $P .*, Python $GLOBAL_PY"
    if test inst -gt 0
        echo "$P already installed."
        elif [[ $(echo "$PIPX_LIST" | grep -ce "package $P") -gt 0 ]]
        echo "Reinstalling $P for $GLOBAL_PY."
        pipx uninstall "$P" && pipx install --python $GLOBAL_PY_PATH "$P"
    else
        pipx install "$P"
    end
    done <"$HOME/.dotfiles/python/pipx-requirements.txt"
end
