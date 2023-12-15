
wget https://imagemagick.org/archive/ImageMagick.tar.gz
tar xvzf ImageMagick.tar.gz
set subdir_tmp (tar -tf ImageMagick.tar.gz | read | string split "/" )
set subdir $subdir_tmp[1]
echo "subdir::::::::$subdir::::::"
echo $subdir
cd $subdir
./configure
make -j4
sudo make install
sudo ldconfig /usr/local/lib
