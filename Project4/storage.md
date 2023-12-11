lsblk 
fdisk -l /dev/xvda view partition table

fdisk /dev/xvda
m
n
p
default
default
+2GiB
w

partprobe - to save changes


fdisk /dev/xvda
d
n

e - create extended partition
w - save changes
partprobe

fdisk /dev/xvda
n


mount the directory onto the partition - to save data

mkdir /tmp/data10 create FS
Format the partition to mount the FS. format it with the FS type
mkfs.ext3 /dev/xvda2
lsblk -f
blkid /dev/xvda2
mount  /dev/xvda2  /tmp/data10
df -hT
tmpfs            95M  4.0K   95M   1% /run/user/1000
/dev/xvda2      956K   24K  884K   3% /tmp/data10


cd /tmp/data10
touch {1..100}


This mount is not permanent, if the system boots, the mount will go. Then. we need to do remounting
So, to avaoid we need to make entry in /etc/fstab

in /etc/fstab
/dev/xvda2 /tmp/data10 ext3 defaults 0 0

umount /tmp/data10
df -hT
mount -a //automatic mount, checks fstab entries and mount
df -hT


formatting logical partition
----------------------------

mkfs.ext4 /dev/xvda5
mkfs.xfs /dev/xvda6
lsblk -f

mkdir /tmp/data20
mkdir /tmp/data30


mount /dev/xvda5 /tmp/data20
mount /dev/xvda6 /tmp/data30
df -h

To use partition as swap space
It will be formatted as swap space
mkswap /dev/xvda2 
swapon /dev/xvda2
swapon -a -> turns all the swap
