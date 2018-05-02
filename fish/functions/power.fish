function power
  set -l p0 (math -s1 (cat /sys/class/power_supply/BAT0/power_now) / 1000000)
  set -l p1 (math -s1 (cat /sys/class/power_supply/BAT1/power_now) / 1000000)
  echo (math -s1 $p0 + $p1) W
end
