#!/bin/bash

wired_interface=$(networkctl list --no-pager | awk '/ether/ && /routable/ {print $2}')
if [ -n "$wired_interface" ]; then
  echo "󰈀 "
  exit
fi

wireless_interface=$(networkctl list --no-pager | awk '/wlan/ && /routable/ {print $2}')
if [ -n "$wireless_interface" ]; then
  echo ""
  exit
fi

echo "󱚼"
