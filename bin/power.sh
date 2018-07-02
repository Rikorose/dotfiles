#/bin/sh

bat0=$(cat /sys/class/power_supply/BAT0/power_now)
bat1=$(cat /sys/class/power_supply/BAT1/power_now)
power_now=$(echo "scale=2; ($bat0 + $bat1) / 1000000" | bc -s)

echo $power_now
