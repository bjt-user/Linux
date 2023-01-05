#### mounting usb sticks

while experience tells that you can often get away without mounting usb sticks...

ChatGPT says:
> In Linux, when you connect a USB drive to your computer, it is not automatically available for use. You need to "mount" the drive, which means you are making the drive accessible and assigning it a location on your computer's file system. When you are finished using the drive, you can "unmount" it, which means you are making it inaccessible and disconnecting it from the file system. This is important for several reasons:

1. Security: When you unmount a drive, it becomes inaccessible to any processes on your computer, which can help protect against malicious software that might try to access the drive.

2. Data integrity: Unmounting a drive properly ensures that all data on the drive is properly saved and closed, which can help prevent data corruption.

3. Resource management: When a drive is mounted, it can use system resources such as CPU and memory. By unmounting a drive when it is not in use, you can free up these resources for other tasks.

4. Ease of use: Mounting and unmounting drives allows you to easily access and disconnect removable storage devices without having to physically unplug them.

Mount the usb stick to a directory, preferably somewhere inside the `/mnt` directory:
```
mount /dev/sdb1 /mnt/mydrive
```

After finishing the work with the USB stick:
```
umount /dev/sdb1
```
