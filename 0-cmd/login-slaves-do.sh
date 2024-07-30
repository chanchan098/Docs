sshpass -p "$1" ssh  -o StrictHostKeyChecking=no "$2@$3" 'bash -s' < $4
