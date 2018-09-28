#!/bin/sh

usage='play (host) [hostfile]'
if [ -z $1 ]; then echo $usage && exit 1; fi

playbook=../$1$playbook'_prepare@playbook.yml'

if [ -z $2 ]; then hostfile='../hosts'; else hostfile=../$2; fi

(
echo '---'
echo '- hosts: '$1
# echo '  gather_facts: no'
echo '  become: True'
echo '  vars:'
echo '    - mode: "'$1'"'
echo '  vars_files:'
echo '    - ../../etc/settings.yml' 
echo '  roles:'
echo '    - common'
) > $playbook

ansible-playbook \
	--inventory-file=$hostfile \
	$playbook \

rm $playbook
exit
