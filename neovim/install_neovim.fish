set NVIM_DIR $HOME/tools/nvim
set NVIM_SRC_NAME $HOME/packages/nvim-linux64.tar.gz
set NVIM_CONFIG_DIR $HOME/.config/nvim
set NVIM_LINK "https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz"
if test -f "$NVIM_DIR/bin/nvim"
    echo "Removing old Nvim installation"
    rm -rf $NVIM_DIR

end
mkdir $NVIM_DIR
echo "Installing Nvim"
echo "Creating nvim directory under tools directory"
if not test -f $NVIM_SRC_NAME
    echo "Downloading Nvim"
    wget "$NVIM_LINK" -O "$NVIM_SRC_NAME"
end
echo "Extracting neovim"
tar zxvf "$NVIM_SRC_NAME" --strip-components 1 -C "$NVIM_DIR"


