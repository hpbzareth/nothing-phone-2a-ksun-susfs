### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

properties() { '
kernel.string=Nothing Phone (2a) [Pacman] Kernel with KernelSU-Next & SuSFS 2.x
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=Pacman
device.name2=pacman
device.name3=PacmanPro
device.name4=pacmanpro
device.name5=Aerodactyl
device.name6=aerodactyl
device.name7=NothingPhone2a
device.name8=NothingPhone2aPlus
supported.versions=13, 14, 15
supported.patchlevels=
'; }

# AnyKernel install variables
block=boot;
is_slot_device=auto;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;

# import functions/variables and setup modules
. tools/ak3-core.sh;

# boot install
split_boot;
flash_boot;
## end boot install
