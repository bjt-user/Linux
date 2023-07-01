#### resources

https://wiki.ubuntuusers.de/Webcam/Treiber/

#### ffmpeg

First you have to find the webcam device.\
In Ubuntu its
```
ls /dev/video*
```
(there might be multiple that you have to try)

or
```
v4l2-ctl --list-devices
```

an easy and fast way to test the webcam: (you might have to change the number behind `/dev/video`)
```
ffplay -window_title Webcam -fast /dev/video0
```

This will record video from the webcam and save it in a file (worked for **Ubuntu** with internal and external webcam):
```
ffmpeg -f v4l2 -framerate 25 -video_size 640x480 -i /dev/video0 output.mp4
```
(replace with your device file)\
Then abort with ctrl + c

**Arch linux** was more work:
```
sudo pacman -Syu
sudo pacman -S linux-headers
sudo pacman -S v4l-utils
sudo reboot
```
You need to make sure, that your kernel (`uname -r`) matches the linux-headers (`sudo pacman -Ss linux-headers`)\
(the kernel needs a reboot after a pacman update to update)

If the kernel module is not loaded automatically you try to load it manually:
```
sudo modprobe uvcvideo
```

Even though the vlc command was there I had to install `vlc`to view the video:
```
sudo apt install vlc
```

```
vlc output.mp4
```

#### use vlc to test the webcam

```
vlc
```
`media` -> `open capture device`\
`capture device` -> `video device name` -> /dev/video0 (or whatever your webcam is)\
`play`


#### cheese

Usually webcams can be tested with `cheese`.\
But how to debug cheese errors?

This internal webcam used to work with cheese:
```
Bus 002 Device 002: ID 04f2:b469 Chicony Electronics Co., Ltd HD WebCam
```
But after a new Ubuntu install it didnt work anymore.\
Maybe because of no proprietary drivers.\
But for proprietary drivers you need secure boot enabled...

```
(cheese:3978): Gdk-WARNING **: 11:23:53.590: Native Windows taller than 65535 pixels are not supported

(cheese:3978): cheese-WARNING **: 11:23:54.084: Internal data stream error.: ../libs/gst/base/gstbasesrc.c(3127): gst_base_src_loop (): /GstCameraBin:camerabin/GstWrapperCameraBinSrc:camera_source/GstBin:bin18/GstPipeWireSrc:pipewiresrc1:
streaming stopped, reason not-negotiated (-4)


(cheese:3978): Clutter-CRITICAL **: 11:23:56.736: Unable to create dummy onscreen: No foreign surface, and wl_shell unsupported by the compositor
```

***
## hardware

#### Logitech C270

plug in the usb and check kernel messages:
```
sudo dmesg -T | less -N
```
```
853 [Sun May 14 08:54:52 2023] usb 3-7: new high-speed USB device number 6 using xhci_hcd
854 [Sun May 14 08:54:52 2023] usb 3-7: New USB device found, idVendor=046d, idProduct=0825, bcdDevice= 1.00
855 [Sun May 14 08:54:52 2023] usb 3-7: New USB device strings: Mfr=2, Product=1, SerialNumber=0
856 [Sun May 14 08:54:52 2023] usb 3-7: Product: HD Webcam C270
857 [Sun May 14 08:54:52 2023] usb 3-7: Manufacturer: HD Webcam C270
858 [Sun May 14 08:54:52 2023] usb 3-7: 3:1: cannot get freq at ep 0x84
859 [Sun May 14 08:54:52 2023] usb 3-7: set resolution quirk: cval->res = 384
860 [Sun May 14 08:54:52 2023] videodev: Linux video capture interface: v2.00
861 [Sun May 14 08:54:52 2023] usb 3-7: Found UVC 1.00 device HD Webcam C270 (046d:0825)
862 [Sun May 14 08:54:52 2023] usb 3-7: Failed to query (GET_INFO) UVC control 10 on unit 1: 0 (exp. 1).
863 [Sun May 14 08:54:52 2023] usbcore: registered new interface driver uvcvideo
864 [Sun May 14 08:54:52 2023] usb 3-7: 3:1: cannot get freq at ep 0x84
865 [Sun May 14 08:54:52 2023] usb 3-7: 3:1: cannot get freq at ep 0x84
```

When testing with `vlc` it has only 1-2 fps.\
But when testing with the `ffmpeg` command and using `-framerate 30` option, it works great.\
With `-framerate 20` it also works good.

***
