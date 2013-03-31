#!/bin/bash

# Date and time
#datetime=$(date +"%F %X")

# array with load
load=($(cat /proc/loadavg))

#temperature
temp=$(($(cat /sys/devices/virtual/thermal/thermal_zone0/temp) / 1000))

# networking
rx_bytes=$(cat /sys/class/net/eth0/statistics/rx_bytes)
tx_bytes=$(cat /sys/class/net/eth0/statistics/tx_bytes)

# memory 
mem=($(cat /proc/meminfo))
mem_div=$(expr ${mem[1]} - ${mem[4]} - ${mem[7]} - ${mem[10]})


#echo datetime: $datetime
#echo load1: ${load[0]}
#echo load5: ${load[1]}
#echo load15: ${load[2]}
#echo Tempertaure: $temp
#echo rx_bytes: $rx_bytes
#echo tx_bytes: $tx_bytes
#echo mem_total: ${mem[1]}
#echo mem_free: ${mem[4]}
#echo mem_buffers: ${mem[7]}
#echo mem_cached: ${mem[10]}
#echo mem_div: $mem_div

#echo "insert into data (date, load1, load5, load15, temp, rx_bytes, tx_bytes, mem_tot, mem_free, mem_buffers, mem_cached, mem_div) values ('"$datetime"', '"${load[0]}"', '"${load[1]}"', '"${load[2]}"', '"$temp"', '"$rx_bytes"', '"$tx_bytes"', '"${mem[1]}"', '"${mem[4]}"', '"${mem[7]}"', '"${mem[10]}"', '"$mem_div"');"
 
sqlite3 data/data.db "insert into data (date, load1, load5, load15, temp, rx_bytes, tx_bytes, mem_tot, mem_free, mem_buffers, mem_cached, mem_div) values (datetime("'"now"'"), "${load[0]}", "${load[1]}", "${load[2]}", "$temp", "$rx_bytes", "$tx_bytes", "${mem[1]}", "${mem[4]}", "${mem[7]}", "${mem[10]}", "$mem_div");"
