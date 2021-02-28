#!/bin/sh
nginx -g "daemon off;" &
/usr/sbin/crond -f -l 8
