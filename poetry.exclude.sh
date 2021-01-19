#! /bin/zsh
echo "Installing pyenv for easy setup of interpreters"
curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py > get-poetry.py
python get-poetry.py



# echo "Do not forget to set the PATH for pyenv to work correctly afterwards!"

export PATH="$HOME/.poetry/bin:$PATH"

poetry config virtualenvs.create true
poetry config virtualenvs.in-project true

