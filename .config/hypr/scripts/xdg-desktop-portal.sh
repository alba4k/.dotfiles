#!/bin/bash
# This script exists because I want to be sure that the portals start in a specific order.
systemctl --user stop xdg-desktop-portal-hyprland
systemctl --user stop xdg-desktop-portal-gtk
systemctl --user stop xdg-desktop-portal
systemctl --user restart xdg-desktop-portal-hyprland
systemctl --user restart xdg-desktop-portal-gtk
systemctl --user restart xdg-desktop-portal
