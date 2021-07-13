#!/bin/sh

fc-list -f '%{family}\n' | awk '!x[$0]++' | sort

