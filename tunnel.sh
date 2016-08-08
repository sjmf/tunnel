#!/bin/bash
set +e
SSH_SOURCE_PORT=$1		#22
SSH_REMOTE_PORT=$2		#20000
SSH_OPTIONS=" -i" ${3:-"/opt/tunnel/id_rsa"}
SSH_DOMAIN=${4:-'sjmf.in'}
SSH_USER=${5:-'tunnel'}

# Always assume initial connection will be successful
export AUTOSSH_GATETIME=0

# Disable echo service, relying on SSH exiting itself
export AUTOSSH_PORT=0

# Check args
if [ "$#" -lt 2 ]; then
    echo "Illegal number of parameters"
fi

#to test, use (check out man ssh for explanation of options):
#autossh -vv -- \
#	$SSH_OPTIONS -o 'ControlPath none' \
#	-R ${SSH_REMOTE_PORT}:localhost:22 \
#	${SSH_USER}@${SSH_DOMAIN} -N \
#		> /var/user_sshlog.out 2> /var/user_ssh_error.out &

#once proven, use (and comment out previous command):
autossh -f -- $SSH_OPTIONS -o 'ControlPath none' \
	-R ${SSH_REMOTE_PORT}:localhost:${SSH_SOURCE_PORT} \
	${SSH_USER}@${SSH_DOMAIN} -N \
		2> ${6:-"/var/user_ssh_error.out"}

