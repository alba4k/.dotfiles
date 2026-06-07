#!/bin/sh
if [[ "$hostname" = "desktop" ]]; then sudo $@; fi

sudo -p "Impronta digitale o password:
" $@
