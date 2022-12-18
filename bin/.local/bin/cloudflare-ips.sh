#!/bin/sh

# Retrieve the published list of cloudflare IPv4 and IPv6 addresses.

Err(){
  printf 'ERROR: %s\n' "$2" 1>&2
  [ "$1" -gt 0 ] && exit "$1"
}

# Dependency check
if ! command -v curl 1> /dev/null 2>&1; then
  Err 1 "'curl' not found!"
fi

cmd='curl -sSf4'
url='https://www.cloudflare.com'

for ver in '4' '6'; do
    result=$($cmd $url/ips-v$ver 2>&1)
    retval=$?
    if [ $retval -ne 0 ]; then
      Err 1 "'curl' failed with exit code: $retval"
    else
      echo "$result" | sed 's/[[:blank:]]/\n/g' | sort
    fi
done



