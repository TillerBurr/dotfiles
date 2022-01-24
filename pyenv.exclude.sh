#! /bin/zsh
echo "Installing pyenv for easy setup of interpreters"
git clone https://github.com/pyenv/pyenv.git ~/.pyenv

echo "Do not forget to set the PATH for pyenv to work correctly afterwards!"

export PATH="${HOME}/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

echo "Setting up python interpreters for testing with tox"
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
echo "WARNING: this will take a long while the first time!"
for v in `cat .python-version`
do
    pyenv install $v
done

pyenv rehash

let global_version=head -1 .python_version
pyenv global $global_version
