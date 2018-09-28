#!/bin/sh

usage='play (mode)'
if [ -z $1 ]; then echo $usage && exit 1; fi

playbook=../'install'$1'@playbook.yml'
hostfile='../hosts'
# if [ -z $4 ]; then hostfile='../hosts'; else hostfile=../$4; fi

(
echo '---'
echo '- hosts: '$1''
echo '  gather_facts: no'
# echo '  become: True'
echo '  vars:'
echo '    - mode: "'$1'"'
# echo '    - dist_name: "'$3'"'
echo '  vars_files:'
echo '    - ../etc/settings.yml'
echo '  roles:'
echo '    - install'
) > $playbook

ansible-playbook \
	--inventory-file=$hostfile \
	$playbook

rm $playbook
exit
