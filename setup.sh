#!/bin/bash

mkdir -p ~/.local/bin

ln -s $(realpath fetches/bunnyfetch) ~/.local/bin
ln -s $(realpath .zshrc) ~/.local/bin
