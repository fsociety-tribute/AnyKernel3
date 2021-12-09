#!/system/bin/sh

# (c) 2019-2021 changes for blu_spark by eng.stk
# (c) 2020-2021 PK's Tuning Script for Pixel 4/XL by pkgnex
# (c) 2021 fsociety tribute by momojuro

# Post-boot time script's execution delay
sleep 90;

# Set bbr as the default TCP cong. algo.
echo "bbr" > /proc/sys/net/ipv4/tcp_congestion_control; # stock is cubic

# Tune schedutil's down rate limit values for better battery life
echo 25000 > /sys/devices/system/cpu/cpufreq/policy0/schedutil/down_rate_limit_us; # stock is 20000
echo 25000 > /sys/devices/system/cpu/cpufreq/policy6/schedutil/down_rate_limit_us; # stock is 20000

# Set zRAM config
swapoff /dev/block/zram0;
sleep 10;
echo 1 > /sys/block/zram0/reset;
echo "lzo-rle" > /sys/block/zram0/comp_algorithm;
echo 2906652672 > /sys/block/zram0/disksize;
mkswap /dev/block/zram0;
swapon /dev/block/zram0 -p 32758;
echo 0 > /proc/sys/vm/page-cluster; # swap pages one at a time

echo "fsociety tribute's tuning: completed." >> /dev/kmsg
