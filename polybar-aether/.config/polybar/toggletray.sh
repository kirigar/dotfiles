if pgrep -x stalonetray > /dev/null; then
	killall stalonetray
else
	stalonetray -c ~/.config/stalonetray/stalonetrayrc &
fi
