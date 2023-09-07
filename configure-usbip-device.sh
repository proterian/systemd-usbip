#!/bin/bash -e
BUS_ID=`/usr/sbin/usbip list -p -l | grep -i "#usbid=${USB_IDVENDOR}:${USB_IDPRODUCT}#" | cut '-d#' -f1`
[[ -z "$BUS_ID" ]] || /usr/sbin/usbip bind --$BUS_ID
sleep 1
usbip attach --remote=localhost --$BUS_ID
sleep 3
usbip port
sleep 3
usbip detach --port=00
