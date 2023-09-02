# Arch Linux live Hyprland
This repo includes files to build custom Arch Linux iso that includes Hyprland as window manager alongside with some usefull software.

## Building
1. Install package `archiso` from Arch Linux repository
1. Run ```./create-media.sh```
1. Copy result file from out directory

## Keybindings
- Super + X - Open alacritty (terminal emulator)
- Super + B - Open firefox
- Super + Q - Close selected window
- Super + E - Open thunar (file manager)
- Super + R - Open wofi (searching installed programs)
- Super + W/A/S/D - Move between windows
- Super + Arrows - Resize Windows
- Super + RMB (Right mouse button) - Resize selected window with mouse
- Super + LMB (Right mouse button) - Move selected window with mouse to new location
- Super + 1-9 - Go to workspace
- Super + Shift + 1-9 - Move selected window to workspace

## Usefull things to know
- Default user to run Hyprland is `archie` with password `toor`. Root account should be untouched so no password.
- Support for Nvidia is questionable. Open source `Nouveau` driver is used. On my GTX 1650 it just freezes and can't do anything, but on GT 520 it works as exptected.
