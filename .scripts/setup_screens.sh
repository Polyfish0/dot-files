#!/bin/sh

DISPLAY=:0
regex="17e9:[0-9,a-f]{4}"
current_usbid=$(lsusb | grep -Eo $regex | sed -r 's/\:/\\\:/g')
echo $current_usbid
if [ $current_usbid = "" ]; then
  exit;
else
  if [ $(ls /home/mwestphal/.desks/ | grep $current_usbid | wc -l) -gt 0 ]; then
    $(/home/mwestphal/.desks/$current_usbid);
  else
    echo "Burder nein" > /tmp/bruder;
  fi
fi
