#!/bin/sh

rsync -vhirlDPO \
    --no-owner \
    --no-group \
    --no-perms \
    --delete \
    --delete-during \
    --ignore-existing \
    /mnt/beets plex:/media/zpool/
