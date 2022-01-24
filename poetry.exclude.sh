#! /bin/zsh
echo "Installing pyenv for easy setup of interpreters"
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python -




# echo "Do not forget to set the PATH for pyenv to work correctly afterwards!"

export PATH="${HOME}/.local/bin:$PATH"

poetry config virtualenvs.create true
poetry config virtualenvs.in-project true

