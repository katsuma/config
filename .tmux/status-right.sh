#!/usr/bin/env bash
# Prints the local network IP address.

nic0="en0"
nic1="en1"
ip0=$(/sbin/ifconfig ${nic0} | grep 'inet ')
ip1=$(/sbin/ifconfig ${nic1} | grep 'inet ')

if [ -n "$ip0" ]; then
  lan_ip="$ip0"
elif [ -n "$ip1" ]; then
  lan_ip="$ip1"
fi

if [ -n "$lan_ip" ]; then
  lan_ip=$(echo "$lan_ip" | awk '{ print $2}')
  echo "ⓛ ${lan_ip}"
  exit 0
else
  exit 1
fi