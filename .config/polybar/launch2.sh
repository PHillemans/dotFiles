killall -q polybar

if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1);do 
        MONITOR=$m polybar -rq power &
        MONITOR=$m polybar -rq 'workspacei3' &
        MONITOR=$m polybar -rq info &
    done
else
    polybar -rq power &
    polybar -rq 'workspacei3' &
    polybar -rq info &
fi
