#!/bin/sh

# curl the list of cloudflare IPs.
#curl https://www.cloudflare.com/ips-v4 -o ./ips-v4
#curl https://www.cloudflare.com/ips-v6 -o ./ips-v6

set -e

Err(){
  printf 'ERROR: %s\n' "$2" 1>&2
  [ "$1" -gt 0 ] && exit "$1"
}

## Dependency check
dep='curl'
if ! command -v $dep 1> /dev/null 2>&1; then
  Err 1 "Dependency '$dep' not found!"
fi

# we use -s to suppress errors and -f to "fail"
# -S with -s will return the error text
cmd='curl -sSf4 --dns-servers 1.1.1.1'
url='https://www.cloudflare.com'

for ver in '4' '6'; do
    result=$($cmd $url/ips-v$ver 2>&1)
    retval=$?
    if [ $retval -ne 0 ]; then
      Err 1 "curl failed with exit code: $retval"
    else
      echo "$result" | sed 's/[[:blank:]]/\n/g' | sort
    fi
done



