# transferring
sshpass -p "$1" sftp  -o StrictHostKeyChecking=no "$2@$3" <<EOF

$(cat $4)

exit
EOF

# scripting
sshpass -p "$1" ssh  -o StrictHostKeyChecking=no "$2@$3" <<EOF

$(cat $5)

exit
EOF