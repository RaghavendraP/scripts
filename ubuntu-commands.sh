To list the physical volumes and their partitions
ubuntu@localhost:~$ sudo lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL
NAME   FSTYPE   SIZE MOUNTPOINT      LABEL
sda             100G
└─sda1 ext4     100G /               cloudimg-rootfs
sdb             400G
└─sdb1 ext4     400G /mnt
sdc    ext4     500G /var/lib/
