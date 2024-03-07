# shell.md

```shell

# a variable
name="joey"

# define an array
fruits=("apple" "banana" "orange")


variablesTrying(){
    # access a variable 
    echo "By \$name is $name" 

    echo "By \${name} also is ${name}"

    echo ""

    readonly name
    name="Chandler"

    echo "Trying to set ${name} to Chandler, but failed because of being an immutable value."
    echo ""

    echo 'Cannot use variables in a pair of single qoute, eg: ${name}.'
    echo ""

    echo "Getting length of a string via \${#string}, eg: \${#name}:${#name}"
    echo ""
}


arrayTrying(){

    echo "To define an array via: array=(v1 v2)"
    echo "To access value in an array via: \${Array[index]}"
    echo "\${fruits[0]}: ${fruits[0]}"
    echo "\${fruits[1]}: ${fruits[1]}"
    echo "\${fruits[2]}: ${fruits[2]}"

    echo "To access all value in an array via: \${Array[@]}"
    echo "\${fruits[@]}: ${fruits[@]}"

    echo "To access len of an array via: \${#Array[@|*]}"
    echo "\${#fruits[@]}: ${#fruits[@]}"
    echo "\${#fruits[*]}: ${#fruits[*]}"
    echo ""

    echo "Got a value from command line parameters."
    echo "\$n, n is a number. \$0 is $0"
    echo "\$1 is $1"

    echo ""
}


flowsTrying(){
    echo "Control flows of shell."

    echo "Using [ expression ] as conditional expression."

    a=10
    b=20
    if [ $a == $b ]
    then
        echo "a 等于 b"
    elif [ $a -gt $b ]
    then
        echo "a 大于 b"
    elif [ $a -lt $b ]
    then
        echo "a 小于 b"
    else
        echo "没有符合的条件"
    fi

    # str1="hello"
    # str2="world"

    # # 使用 [[]] 进行字符串判断
    # if [[ "$str1" == "$str2" ]]; then
    # echo "Strings are equal"
    # else
    # echo "Strings are not equal"
    # fi

    echo "Using (( expression )) as conditional expression. Can't use to compare string."
    if (( $a == $b ))
    then
        echo "a 等于 b"
    elif (( $a > $b ))
    then
        echo "a 大于 b"
    elif (( $a < $b ))
    then
        echo "a 小于 b"
    else
        echo "没有符合的条件"
    fi

    echo "for expression"

    echo "Looping all fruits"
    for fruit in ${fruits[@]}
    do
        echo "$fruit"
    done

    echo "Looping all fruits by index"

    for((i==0; i<${#fruits[@]}; i++))
    do
        echo "\${fruits[$i]} ${fruits[i]}"
    done

    echo "while expression"
    restartingCount=0
    MAX=3
    while (($MAX > $restartingCount))
    do
        restartingCount=$[$restartingCount+1]
        echo "restarting at $restartingCount times"
        sleep 1
    done

    echo "case expression"
    echo '输入 1 到 4 之间的数字:'
    echo '你输入的数字为:'
    read aNum
    case $aNum in
        1) echo '你选择了 1'
        ;;
        2) echo '你选择了 2'
        ;;
        3) echo '你选择了 3'
        ;;
        4) echo '你选择了 4'
        ;;
        *) echo '你没有输入 1 到 4 之间的数字'
        ;;
    esac
}


forLoopTrying(){

    images=("registry.cn-hangzhou.aliyuncs.com/google_containers/kube-apiserver:v1.29.1" 
    "registry.cn-hangzhou.aliyuncs.com/google_containers/kube-controller-manager:v1.29.1" 
    "registry.cn-hangzhou.aliyuncs.com/google_containers/kube-scheduler:v1.29.1" 
    "registry.cn-hangzhou.aliyuncs.com/google_containers/kube-proxy:v1.29.1" 
    "registry.cn-hangzhou.aliyuncs.com/google_containers/coredns:v1.11.1" 
    "registry.cn-hangzhou.aliyuncs.com/google_containers/pause:3.9" 
    "registry.cn-hangzhou.aliyuncs.com/google_containers/pause:3.6" 
    "registry.cn-hangzhou.aliyuncs.com/google_containers/etcd:3.5.10-0" )


    echo "Looping all images"
    for img in ${images[@]}
    do
        echo "crictl pull $img"
    done
}


stringExtracting(){
    prefix="registry.cn-hangzhou.aliyuncs.com/google_containers"


    # "2>&1" 表示将stderr重定向到与文件描述符1相同的位置
    pending=(
        "registry.k8s.io/kube-apiserver:v1.29.1" 
        "registry.k8s.io/kube-controller-manager:v1.29.1" 
        "registry.k8s.io/kube-scheduler:v1.29.1" 
        "registry.k8s.io/kube-proxy:v1.29.1" 
        "registry.k8s.io/coredns/coredns:v1.11.1" 
        "registry.k8s.io/pause:3.9" 
        "registry.k8s.io/etcd:3.5.10-0" 
    )
    for p in ${pending[@]}
    do
        # echo "crictl pull $p"
        res=$(echo "$p" | sed "s|registry.k8s.io|$prefix|")       
        
        pull=$(echo "ctictl pull $res")        
        tag=$(echo "ctr -n k8s.io i tag $res $p")
        # echo "$pull" >> res.txt
        # echo "$tag" >> k8s__temp_res.txt

    done


    #cat k8s__temp_res.txt >> res.txt

    #rm -rf k8s__temp_res.txt

}

cmdVarsTrying(){
    # % 2^8+1

    echo "num1 is $1"
    echo "num2 is $2"
    
    return $(($1+$2))
    #return "A string from funTrying"
}


argsTest(){
    echo "$0"
    echo "$1 A string from fun"
}
argsTest
# stringExtracting
# forLoopTrying
# variablesTrying
# arrayTrying
# flowsTrying

# funTrying 12 34
# echo "Getting returned value: $?"

# echo `funString`

# DATE=$(date +%Y-%m-%d-%H:%M:%S)

# echo $DATE
# echo $JAVA_HOME
```