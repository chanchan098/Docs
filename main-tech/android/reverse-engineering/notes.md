## Retrieving ui tree

https://github.com/alexal1/Insomniac/wiki/UI-Automator-Viewer:-What-Is-It-And-How-To-Use-It


MUST use java8, by `set java_exe=` at `androidsdk\tools\bin\uiautomatorviewer.bat`


## Find current `Activity`

`adb shell dumpsys activity activities | findstr mResumedActivity`

## IDA7.7+leidian .so调试，android_server的问题

1\. 查询模拟器架构

`adb shell getprop ro.product.cpu.abi`  
`x86_64`

2\. 选择合适的`android_server`

`/data/local/tmp`

android_server的架构要和so匹配

- android_server
- android_server64
- android_x64_server
- android_x86_server

选择合适的\.so

可以先加载其他架构的so

再查看ida output，查看被加载的so

`D3C8E000: loaded /data/data/com.dreamapp.dubhe/.jiagu/libjiagu.so`

4\. 端口转发

`adb forward tcp:23946 tcp:23946`

## jdb

get pid of application

```
adb shell 
ps -A | grep {package}
```

get pid can be used in jdb of the app


```shell
adb jdwp

adb forward tcp:12345 jdwp:2958
jdb -connect com.sun.jdi.SocketAttach:hostname=127.0.0.1,port=12345
```

## 脱壳

- [FART](https://github.com/hanbinglengyue/FART)
- [frida_dump](https://github.com/lasting-yang/frida_dump)
- [frida_dump](https://github.com/hluwa/frida-dexdump)
