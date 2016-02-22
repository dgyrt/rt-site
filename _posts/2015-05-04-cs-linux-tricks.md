---
layout: page
title: "Linux Tricks"
category: cs
date: 2015-05-04 12:00:00
---

While I'm using Linux, I discovered there are many handy tricks I can use to speed up my workload. I will document these tricks so I don't have to look them up again and again. And to be clear, I'm using Ubuntu.

#### Extract a tar file and place it in the same name folder

~~~
for f in *.tar; do mkdir ./${f%%.*} && tar -xf $f -C. /${f%%.*}; done
~~~

#### exFAT support

~~~
sudo apt-get install exfat-utils exfat-fuse
~~~

And you don't need to reboot

#### RAR support

~~~
sudo apt-get install unrar
~~~

### Ubuntu switch to console mode and display black screen

The graphical text-mode resolution set at boot up is not compatible with your video card.

~~~
sudo sed -i -e 's/#GRUB_TERMINAL/GRUB_TERMINAL/g' /etc/default/grub
sudo update-grub
sudo reboot
~~~

### Generate GIF with ImageMagick

~~~
convert -delay 20 -loop 0 *jpg animated.gif
~~~
