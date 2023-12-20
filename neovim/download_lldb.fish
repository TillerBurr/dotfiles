#! /usr/bin/fish
if test -d $HOME/.codelldb/
    rm -rf $HOME/.codelldb
end

curl -L https://github.com/vadimcn/codelldb/releases/download/v1.10.0/codelldb-x86_64-linux.vsix > ~/codelldb.vsix
unzip ~/codelldb.vsix -d ~/.codelldb
