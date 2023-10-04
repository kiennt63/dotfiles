sudo apt install -y bison flex font-manager libcairo-dev libxcb-util-dev libgdk-pixbuf2.0-dev libstartup-notification0-dev libxkbcommon-dev libxkbcommon-x11-dev libxcb-imdkit-dev build-essential libpango1.0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-randr0-dev libxcb-cursor-dev libxcb-xinerama0-dev autoconf automake libtool

# install check 0.15.2
# sudo apt install -y autoconf
# sudo apt install -y automake
# sudo apt install -y libtool

cd $HOME/ins
wget https://github.com/libcheck/check/releases/download/0.15.2/check-0.15.2.tar.gz
untar check-0.15.2.tar.gz
cd check-0.15.2
autoreconf --install
./configure
make
# make check
sudo make install

# install rofi
cd $HOME/ins
wget https://github.com/davatorium/rofi/releases/download/1.7.5/rofi-1.7.5.tar.gz
untar rofi-1.7.5.tar.gz
cd rofi-1.7.5
mkdir build && cd build
../configure
make -j8
sudo make install

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
./libtool --finish /usr/local/lib/rofi/
