# FineOS configuration for NixOS

> [!IMPORTANT]  
> I just made this configuration public, if there is any personal information left in it, please contact me so I can remove it.

> [!WARNING]
> Currently this config needs to be located inside '$HOME/FineOS/' for everything to work.
> Most stuff should be fine, but some things will break when you store it somewhere else.

This is my nixos configuration for my personal machine and laptop. This project is worked on just for my personal use, so everything about it is very opinionated and with no guarantees to work on other systems. 

# Overview

A quick overview of the different hosts configured in this repo.

## Personal

The system I use for work and personal use. At some point I might split it up in work and personal, if there start to appear a lot of applications I use only for one.

- Window Manager: Hyprland
- Bar: Waybar
- Launcher: Rofi
- Shell: Zsh
- Terminal: Kitty
- Text editor: neovim
- File manager: thunar (gui) and yazi (tui)

## Laptop 

Almost the same as personal, with some adjustments to the monitor setup and laptop specific tweaks.

# Project structure
The configuration is currently only for my personal computer and consists of the following main folders:

- hosts: contains the configuration for different machines. Currently only for my personal computer, but there will probably be added configurations for a server and a raspberry pi as well
- scripts: this folder will be moved at some point, it contains different scripts used for my personal machine 
- sysem: nix configuration files used for the system configuration 
- user: nix configuration files used for home-manager configuration 
- themes: base16 theme files

# How to  configure

When setting up a new machine you first have to choose the host (which is more or less just a configuration profile) from the hosts folder and change the 'host' variable in the flake to the one you want.

Next replace the hardware-configuration inside the hosts folder. Write your own or just copy the auto generated one you get after a new installation (this is what I did). 

Then create systemSettings.nix and userSettings.nix from their respective example files and adjust the settings accordingly.

You have to enable the (currently) experimental features for nix flakes, after which you can rebuild the systen with the flake.

What the settings do should be obvious by their name. If anything is unclear or should be renamed let me know.
