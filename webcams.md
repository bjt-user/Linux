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

This will record video from the webcam (worked for **Ubuntu** with internal and external webcam):
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
