sudo apt install -y bison
sudo apt install -y flex
sudo apt install -y font-manager
sudo apt install -y libcairo-dev
sudo apt install -y libxcb-dev
sudo apt install -y libxcb-util-dev
sudo apt install -y libxcb-util-wm-dev
sudo apt install -y liglib2.0-dev
sudo apt install -y libgdk-pixbuf2.0-dev
sudo apt install -y libstartup-notification0-dev
sudo apt install -y libxkbcommon-dev
sudo apt install -y libxkbcommon-x11-dev
sudo apt install -y libimdkit-dev
sudo apt install -y libxcb-imdkit-dev
sudo apt install -y build-essential
sudo apt install -y libpango1.0-dev
sudo apt install -y libxcb-ewmh-dev
sudo apt install -y libxcb-icccm-dev
sudo apt install -y libxcb-icccm4-dev
sudo apt install -y libxcb-randr-dev
sudo apt install -y libxcb-randr0-dev
sudo apt install -y libxcb-cursor-dev
sudo apt install -y libxcb-xinerama-dev
sudo apt install -y libxcb-xinerama0-dev

# install check 0.15.2
sudo apt install autoconf
sudo apt install automake
sudo apt install libtool

cd $HOME/ins
wget https://github.com/libcheck/check/releases/download/0.15.2/check-0.15.2.tar.gz
untar check-0.15.2.tar.gz
cd check-0.15.2
autoreconf --install
./configure
make
make check
sudo make install

# install rofi
cd $HOME/ins
wget https://github.com/davatorium/rofi/releases/download/1.7.5/rofi-1.7.5.tar.gz
untar rofi-1.7.5.tar.gz
cd rofi-1.7.5
meson setup build
ninja -C build
sudo ninja -C build install

# install rofi-calc
cd $HOME/ins
git clone https://github.com/svenstaro/rofi-calc.git
cd rofi-calc
mkdir m4
autoreconf -i
mkdir build && cd build 
../configure
make 
sudo make install 
./libtool --finish /usr/local/lib/x86_64-linux-gnu/rofi/
