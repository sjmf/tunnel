# tunnel
Reverse tunnel setup scripts (autossh)

# Set up
```
sudo su

apt-get install autossh
mkdir /opt/tunnel
cp *.sh /opt/tunnel
cd /opt/tunnel
chown root:root *
ssh-keygen -f ./id_rsa -P ''
ssh-copy-id -i ./id_rsa tunnel@sjmf.in
ssh tunnel@sjmf.in

echo "/opt/tunnel/tunnel.sh 22 20033 >/var/log/user_tunnel.log 2>&1 &" >> /etc/rc.local
# (then vi it to check there's no exit 0 on the end)

# Create wifi.sh cronjob
MYCRON=$(mktemp)
crontab -l > $MYCRON &&\
    echo "* * * * * bash /opt/tunnel/wifi.sh > /var/log/wifi.log 2>&1" >> $MYCRON &&\
    crontab $MYCRON 
rm $MYCRON

```

