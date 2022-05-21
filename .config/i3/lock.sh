img=/tmp/i3lock.png

maim $img
#convert $img -scale 5% -scale 2000% $img
convert $img -blur 0x15 $img

i3lock -i $img -p default
