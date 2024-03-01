#!/bin/sh

cursor_theme_name=$1

sed -i "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=$cursor_theme_name/g" "$HOME/dotfiles/gnome/gtk-3.0/settings.ini" 
sed -i "s/gtk-cursor-theme-name=.*/gtk-cursor-theme-name=\"$cursor_theme_name\"/g" "$HOME/dotfiles/gnome/.gtkrc-2.0"
sed -i "s/Inherits=.*/Inherits=$cursor_theme_name/g" "$HOME/.icons/default/index.theme"
sed -i "s/Xcursor.theme:.*/Xcursor.theme: $cursor_theme_name/g" "$HOME/dotfiles/.Xresources"
