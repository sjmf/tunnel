#!/bin/bash
set +e

SSH_OPTIONS='-nNT -i /opt/tunnel/id_rsa'
SSH_DOMAIN='sjmf.in'
SSH_USER='tunnel'
SSH_SOURCE_PORT=$1		#22
SSH_REMOTE_PORT=$2		#20000

# Check args
if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters"
fi

while sleep 5; do
	ssh $SSH_OPTIONS -gR ${SSH_REMOTE_PORT}:localhost:${SSH_SOURCE_PORT} ${SSH_USER}@${SSH_DOMAIN} 
done 2> /var/log/user_ssh_error.out

