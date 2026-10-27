# 2026-10-22

I manually edited the `/mnt/etc/fstab` file and included the `/boot` \
partition as well.

After reboot it boots into `grub`.\
But I cannot select an arch linux installation.\
I can only select `grub_20261022` => but this will result in another reboot.

Maybe the fstab file was not correct?

I think the problem was, that I put the `/boot` mount before the `/` \
mount in the fstab file.\
Maybe the `/boot` entry is not needed at all and will be added by systemd \
automatically later?
