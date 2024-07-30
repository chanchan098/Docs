# transfer files before run commands
# $1, cmds to process files FROM sftp
# $2, cmds to run to do something, shell script

slavesAddresses=("192.168.0.242" "192.168.0.243" "192.168.0.244")
slavesUsers=("root" "root" "root")
slavesPwds=("joeyjoey" "joeyjoey" "joeyjoey")

for((i==0; i<${#slavesAddresses[@]}; i++))
do
    address=${slavesAddresses[i]}
    user=${slavesUsers[i]}
    pwd=${slavesPwds[i]}
    
    echo $address
    ./login-slaves-files-cmds-do.sh $pwd $user $address $1 $2
    sleep 2

    echo ""
done