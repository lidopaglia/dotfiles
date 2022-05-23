#!/usr/bin/env bash

# intended to run via cron and alert if the public IP address is
# found in DNS for the given domain.

set -e

# Read variables from .env file
CONFIG="$HOME/.config/private.env"

[ -f "$CONFIG" ] || Err 1 "Provided config $CONFIG is not a regular file."
[ -r "$CONFIG" ] || Err 1 "Provided config $CONFIG is unreadable."
[ -f "$CONFIG" ] &&
  export $(cat "$CONFIG" | sed 's/#.*//g' | xargs) ||
  Err 1 "Could not parse '$CONFIG' file!"

DOMAIN="${DOMAIN}"                  # Domain to monitor
ID="${DISCORD_WEBHOOK_ID}"          # Webhook ID
TOKEN="${DISCORD_WEBHOOK_TOKEN}"    # Webhook Token
DNS_SERVER="${DNS_SERVER:=1.1.1.1}" # Default to Cloudflare

Err(){
  printf 'ERROR: %s\n' "$2" 1>&2
  [ "$1" -gt 0 ] && exit "$1"
}

ip_from_dns(){
  CF_IP=$(dig +short @$DNS_SERVER ch txt whoami.cloudflare +time=3 | tr -d '"')
  CF_IP_LEN=${#CF_IP}

  # if cloudflare fails, try opendns
  IP=$([ "$CF_IP_LEN" -gt 15 ] && \
    echo $(dig +short myip.opendns.com @resolver1.opendns.com +time=3) || \
    echo "$CF_IP")

  echo "$IP"
}

ip_from_http(){
  URLs=(
    "https://icanhazip.com"    \
    "https://ifconfig.me"      \
    "https://api.ipify.org"    \
    "https://ipinfo.io/ip"     \
    "https://ipecho.net/plain" )

  CMD='curl -sSf'

  IP=$(eval \
     "$(echo "${URLs}" \
     | sed -e "s/\s/ || ${CMD} /g;s/^/${CMD} /")")

  [ -z "${IP}" ] && Err 1 \
    "Could not determine WAN address via HTTP."

  echo "$IP"
}

send_alert(){
  apprise -t "$1" -b "$2" \
    discord://${ID}/${TOKEN}/?avatar=No
}

## Dependency check
for dep in curl dig apprise; do
  if ! command -v "$dep" 1> /dev/null 2>&1; then
    Err 1 "'$dep' not found! Is it installed?"
  fi
done

# Get WAN address
WAN=$(ip_from_dns)
#WAN=$(ip_from_http)

# Get address(es) registered in DNS
DNS=$(dig +short @$DNS_SERVER "$DOMAIN")

for RECORD in ${DNS}
do
  if [ "$RECORD" == "$WAN" ]; then
    subject=$(basename "${BASH_SOURCE[0]}")
    message="Your public IP was found in DNS for \"$DOMAIN\""
    send_alert "$subject" "$message"
    echo "[$(date -Is)] $message"
  fi
done

