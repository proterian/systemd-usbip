#!/bin/bash -e
PATH=/etc:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
#BUS_ID=`/usr/sbin/usbip list -p -l | grep -i "#usbid=${USB_IDVENDOR}:${USB_IDPRODUCT}#" | cut '-d#' -f1`
BUS_ID=`/usr/bin/usbip list -p -l | grep -i "busid=${USB_ID}" | cut '-d#' -f1`
[[ -z "$BUS_ID" ]] || /usr/sbin/usbip bind --$BUS_ID
sleep 1
usbip attach --remote=localhost --$BUS_ID
sleep 3
usbip port
sleep 3
usbip detach --port=00
