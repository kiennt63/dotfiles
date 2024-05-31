#!/bin/bash

mkdir -p ~/ins
cd ~/ins
git clone https://github.com/dunst-project/dunst.git
cd dunst 
make
sudo make install
