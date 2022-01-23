#!/run/current-system/sw/bin/bash

dir="$HOME/.config/rofi/powermenu"
color="nightly.rasi"
theme="card_square.rasi"

sed -i -e "s/@import .*/@import \"$color\"/g" $dir/styles/colors.rasi

rofi_command="rofi -theme $dir/$theme"

##  Options
screenshot=""
desktop=""
app=""
out=""

# Variable passed to rofi
options="$screenshot\n$desktop\n$app\n$out"

chosen="$(echo -e "$options" | $rofi_command -p "Screenshots" -dmenu -selected-row 2)"
case $chosen in
    $screenshot) notify-send "Screenshotting in 5 seconds" && scrot -e 'mv $f ~/Pictures/ScreenShots' -d 5; ;;
    $desktop) scrot -e 'mv $f ~/Pictures/ScreenShots' -d 1 && notify-send "Screenshotting desktop"; ;;
    $app) scrot -d 1 -s -e 'mv $f ~/Pictures/ScreenShots' && notify-send "Screenshotting application"; ;;
    $out) exit 0; ;;
    *) exit 0; ;;
esac

