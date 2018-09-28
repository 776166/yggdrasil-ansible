#!/bin/sh

usage='play (hosts) [hostsfile]'
if [ -z $1 ]; then echo $usage && exit 1; fi

hosts="hosts"
if [ ! -z $2 ]; then hosts=$2; fi

ansible $1 -i ../$hosts -m setup

exit