cp -r ~/.config/i3 ./.config
cp -r ~/.config/rofi ./.config
cp -r ~/.config/polybar ./.config
cp -r ~/.config/powermenu ./.config
cp -r ~/.config/kitty ./.config/

rsync -av --progress --exclude="bundle" ~/.config/nvim/ ./.config/nvim/ 
