#!/usr/bin/env sh

if [ ! -f /etc/tinc/.init ]; then
	rsync -r /tmp/lightyears /etc/tinc
	#tincd -n lightyears -K 4096
	touch /etc/tinc/.init
fi

tincd -D -n lightyears --logfile=/var/log/tinc.log
