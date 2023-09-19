#!/bin/sh
#BUS_ID=`/usr/sbin/usbip list -p -l | grep -i "#usbid=${USB_IDVENDOR}:${USB_IDPRODUCT}#" | cut '-d#' -f1`
BUS_ID=`/usr/bin/usbip list -p -l | grep -i "busid=${USB_ID}" | cut '-d#' -f1`
[[ -z "$BUS_ID" ]] || /usr/sbin/usbip unbind --$BUS_ID

