slavesAddresses=("192.168.0.242" "192.168.0.243" "192.168.0.244")
slavesUsers=("root" "root" "root")
slavesPwds=("joeyjoey" "joeyjoey" "joeyjoey")

for((i==0; i<${#slavesAddresses[@]}; i++))
do
    address=${slavesAddresses[i]}
    user=${slavesUsers[i]}
    pwd=${slavesPwds[i]}
    # $1 cmd file
    echo $address
    ./login-slaves-f-do.sh $pwd $user $address $1
    sleep 2

    echo ""
done