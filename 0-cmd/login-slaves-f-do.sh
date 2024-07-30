sshpass -p "$1" sftp  -o StrictHostKeyChecking=no "$2@$3" <<EOF
# do something in here

$(cat $4)

exit
EOF