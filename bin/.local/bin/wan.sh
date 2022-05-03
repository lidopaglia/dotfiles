#!/bin/sh

# Query public endpoints to determine the WAN IP address.

Err(){
  printf 'ERROR: %s\n' "$2" 1>&2
  [ "$1" -gt 0 ] && exit "$1"
}

curlIpAddress(){

  URLs=$("https://icanhazip.com" \
         "https://ifconfig.me" \
         "https://api.ipify.org" \
         "https://ipinfo.io/ip" \
         "https://ipecho.net/plain")

  CMD='curl -sSf --dns-servers 1.1.1.1'

  IP=$(eval \
     "$(echo "${URLs}" \
     | sed -e "s/\s/ || ${CMD} /g;s/^/${CMD} /")")

  [ -z "${IP}" ] && Err 1 "Could not determine WAN address."

  echo "$IP"
}

# Use DNS_SERVER ENV variable or default to 1.1.1.1
DNS_SERVER=${DNS_SERVER:=1.1.1.1}

## Dependency check
###################
for dep in curl dig; do
  if ! command -v "$dep" 1> /dev/null 2>&1; then
    Err 1 "'$dep' not found! Is it installed?"
  fi
done

CF_IP=$(dig +short @$DNS_SERVER ch txt whoami.cloudflare +time=3 | tr -d '"')
CF_IP_LEN=${#CF_IP}

# if cloudflare fails, try opendns
IP_ADDRESS=$([ "$CF_IP_LEN" -gt 15 ] && \
  echo $(dig +short myip.opendns.com @resolver1.opendns.com +time=3) || \
  echo "$CF_IP")

# if dns method fails, use http method
if [ "$IP_ADDRESS" = "" ]; then
  IP_ADDRESS=curlIpAddress
fi

echo $IP_ADDRESS
