#!/system/bin/sh

# (c) 2019-2021 changes for blu_spark by eng.stk
# (c) 2021 fsociety tribute by momojuro

# Post-boot complete script's execution delay
sleep 30;

# Set bbr as the default TCP cong. algo.
echo "bbr" > /proc/sys/net/ipv4/tcp_congestion_control; # stock is cubic

# Set zRAM config
swapoff /dev/block/zram0;
echo 1 > /sys/block/zram0/reset;
echo "lz4" > /sys/block/zram0/comp_algorithm;
echo 4399574016 > /sys/block/zram0/disksize;
mkswap /dev/block/zram0;
swapon /dev/block/zram0 -p 32758;
echo 0 > /proc/sys/vm/page-cluster; # swap pages one at a time

echo "fsociety tribute's tuning: completed." >> /dev/kmsg
