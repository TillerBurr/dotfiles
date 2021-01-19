#! /bin/zsh
echo "Installing pyenv for easy setup of interpreters"
$ curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | zsh

echo "Do not forget to set the PATH for pyenv to work correctly afterwards!"

export PATH="${HOME}/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

echo "Setting up python interpreters for testing with tox"
echo "WARNING: this will take a long while the first time!"
for v in `cat .python-version`
do
    pyenv install $v
done

pyenv rehash

let global_version=head -1 .python_version
pyenv global $global_version