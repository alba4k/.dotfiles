#!/bin/bash
systemctl --user stop xdg-desktop-portal-hyprland
systemctl --user stop xdg-desktop-portal
systemctl --user restart xdg-desktop-portal-hyprland
systemctl --user restart xdg-desktop-portal
