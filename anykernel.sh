# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers
# blu_spark changes by eng.stk

## AnyKernel setup
# begin properties
properties() { '
kernel.string=fsociety tribute
do.devicecheck=1
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=0
device.name1=redbull
device.name2=
supported.versions=12
supported.patchlevels=
'; } # end properties

# shell variables
block=/dev/block/bootdevice/by-name/boot;
is_slot_device=1;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;


## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 750 750 $ramdisk/*;

## AnyKernel install
dump_boot;

# remove old root patch avoidance hack
patch_cmdline "skip_override" "";

write_boot;
## end install

