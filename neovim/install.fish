#! /usr/bin/fish
#run this after mise is installed




if not test -d "$HOME/packages/"
    mkdir -p "$HOME/packages/"
end

if not test -d "$HOME/tools/"
    mkdir -p "$HOME/tools/"
end

set NVIM_PYTHON_DIR $HOME/tools
if not test -d "$NVIM_PYTHON_DIR"
    mkdir -p "$NVIM_PYTHON_DIR"
end
echo "Setting up virtual environment in $NVIM_PYTHON_DIR"

set RYE_TOOLCHAIN (rye toolchain list)
set PY_EXE (string split ")" (string split "(" $RYE_TOOLCHAIN)[2])[1]


$PY_EXE -m venv $NVIM_PYTHON_DIR/.venv
set  PY_PACKAGES pynvim jupyter_client cairosvg pnglatex plotly kaleido pyperclip nbformat debugpy ruff

echo "Installing Python packages"
for p in $PY_PACKAGES
echo "Installing $p"
    $NVIM_PYTHON_DIR/.venv/bin/python -m pip install "$p"
end


set NODE_DIR ($HOME/.local/bin/mise where node@19)
$NODE_DIR/bin/npm install -g vim-language-server
$NODE_DIR/bin/npm install -g bash-language-server

set LUA_LS_DIR $HOME/tools/lua-language-server
set LUA_LS_SRC $HOME/packages/lua-language-server.tar.gz
set LUA_LS_LINK "https://github.com/LuaLS/lua-language-server/releases/download/3.6.11/lua-language-server-3.6.11-linux-x64.tar.gz"

if not command -v lua-language-server; and not test -f "$LUA_LS_DIR/bin/lua-language-server"
    echo 'Install lua-language-server'
    if not test -f $LUA_LS_SRC
        echo "Downloading lua-language-server and renaming"
        wget $LUA_LS_LINK -O "$LUA_LS_SRC"
    end

    if not test -d "$LUA_LS_DIR"
        echo "Creating lua-language-server directory under tools directory"
        mkdir -p "$LUA_LS_DIR"
        echo "Extracting to directory $LUA_LS_DIR"

        tar zxvf "$LUA_LS_SRC" -C "$LUA_LS_DIR"
    end

else
    echo "lua-language-server is already installed. Skip installing it."
end


set RIPGREP_DIR $HOME/tools/ripgrep
set RIPGREP_SRC_NAME $HOME/packages/ripgrep.tar.gz
set RIPGREP_LINK "https://github.com/BurntSushi/ripgrep/releases/download/12.0.0/ripgrep-12.0.0-x86_64-unknown-linux-musl.tar.gz"
if not command -v rg; and not test -f "$RIPGREP_DIR/rg"
    echo "Install ripgrep"
    if not test -f $RIPGREP_SRC_NAME
        echo "Downloading ripgrep and renaming"
        wget $RIPGREP_LINK -O "$RIPGREP_SRC_NAME"
    end

    if not test -d "$RIPGREP_DIR"
        echo "Creating ripgrep directory under tools directory"
        mkdir -p "$RIPGREP_DIR"
        echo "Extracting to $HOME/tools/ripgrep directory"
        tar zxvf "$RIPGREP_SRC_NAME" -C "$RIPGREP_DIR" --strip-components 1
    end

    # set up manpath and zsh completion for ripgrep
    mkdir -p "$HOME/tools/ripgrep/doc/man/man1"
    mv "$HOME/tools/ripgrep/doc/rg.1" "$HOME/tools/ripgrep/doc/man/man1"

        echo 'set -gx MANPATH $HOME/tools/ripgrep/doc/man $MANPATH' >> "$HOME/.bash_profile"
else
    echo "ripgrep is already installed. Skip installing it."
end



#######################################################################
#                                Nvim install                         #
#######################################################################
set NVIM_DIR $HOME/tools/nvim
set NVIM_SRC_NAME $HOME/packages/nvim-linux64.tar.gz
set NVIM_CONFIG_DIR $HOME/.config/nvim
set NVIM_LINK "https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz"
if not test -d $NVIM_DIR
    mkdir $NVIM_DIR
end
if not test -f "$NVIM_DIR/bin/nvim"
    echo "Installing Nvim"
    echo "Creating nvim directory under tools directory"


    if not test -f $NVIM_SRC_NAME
        echo "Downloading Nvim"
        wget "$NVIM_LINK" -O "$NVIM_SRC_NAME"
    end
    echo "Extracting neovim"
    tar zxvf "$NVIM_SRC_NAME" --strip-components 1 -C "$NVIM_DIR"


else
    echo "Nvim is already installed. Skip installing it."
end

echo "Setting up config and installing plugins"

echo "Installing nvim plugins, please wait"
$NVIM_DIR/bin/nvim -c "autocmd User LazyInstall quitall"  -c "lua require('lazy').install()"
$NVIM_DIR/bin/nvim -c "PylspInstall pylsp-mypy pyls-isort python-lsp-black python-lsp-ruff"
$NVIM_DIR/bin/nvim -c "UpdateRemotePlugins"

./download_lldb.fish
