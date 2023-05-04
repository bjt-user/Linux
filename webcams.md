#### cheese

Usually webcams can be tested with `cheese`.\
But how to debug cheese errors?

This internal webcam used to work with cheese:
```
Bus 002 Device 002: ID 04f2:b469 Chicony Electronics Co., Ltd HD WebCam
```


```
(cheese:3978): Gdk-WARNING **: 11:23:53.590: Native Windows taller than 65535 pixels are not supported

(cheese:3978): cheese-WARNING **: 11:23:54.084: Internal data stream error.: ../libs/gst/base/gstbasesrc.c(3127): gst_base_src_loop (): /GstCameraBin:camerabin/GstWrapperCameraBinSrc:camera_source/GstBin:bin18/GstPipeWireSrc:pipewiresrc1:
streaming stopped, reason not-negotiated (-4)


(cheese:3978): Clutter-CRITICAL **: 11:23:56.736: Unable to create dummy onscreen: No foreign surface, and wl_shell unsupported by the compositor
```
