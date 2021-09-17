#!/system/bin/sh

# (c) 2019-2020 changes for blu_spark by eng.stk
# (c) 2020-2021 PK's Tuning Script for Pixel 4/XL by pkgnex
# (c) 2021 fsociety tribute by momojuro

# Wait to set the init values
sleep 30;

# Disable zRAM
swapoff /dev/block/zram0;

# Set BBRv2 as the default TCP cong. algo.
echo "bbr2" > /proc/sys/net/ipv4/tcp_congestion_control; # stock is westwood

# Tune schedutil's down rate limit values for better battery life
echo 25000 > /sys/devices/system/cpu/cpufreq/policy0/schedutil/down_rate_limit_us; # stock is 20000
echo 25000 > /sys/devices/system/cpu/cpufreq/policy6/schedutil/down_rate_limit_us; # stock is 20000

# Set zRAM config
echo 1 > /sys/block/zram0/reset;
echo "lzo-rle" > /sys/block/zram0/comp_algorithm;
echo 2906652672 > /sys/block/zram0/disksize;
echo 0 > /proc/sys/vm/page-cluster;
mkswap /dev/block/zram0;
swapon /dev/block/zram0 -p 32758;

echo "fsociety tribute's tuning: completed." >> /dev/kmsg
