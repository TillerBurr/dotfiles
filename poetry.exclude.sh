#! /bin/zsh
echo "Installing poetry"
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python -


export PATH="${HOME}/.local/bin:$PATH"

poetry config virtualenvs.create true
poetry config virtualenvs.in-project true

