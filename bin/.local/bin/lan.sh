#!/bin/sh

# Print the active IPv4 interface name and address

Err(){
  printf 'ERROR: %s\n' "$2" 1>&2
  [ "$1" -gt 0 ] && exit "$1"
}

IP=$(ip -br -f inet address | awk '/UP/ {gsub(/\/24/, ""); print $1 ": " $3}')

[ -z "${IP}" ] && Err 1 "Could not determine LAN address."

echo "$IP"
