#./do.sh $pwd $user $address

sshpass -p "$1" sftp  -o StrictHostKeyChecking=no "$2@$3" <<EOF
# do something in here

put /root/.ssh/id_rsa.pub /root/.ssh/244.pub

exit
EOF

sshpass -p "$1" ssh  -o StrictHostKeyChecking=no "$2@$3" <<EOF

cat /root/.ssh/244.pub >> /root/.ssh/authorized_keys

cat /root/.ssh/authorized_keys

systemctl restart sshd
systemctl restart ssh

exit
EOF