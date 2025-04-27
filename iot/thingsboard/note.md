## Thingsboard

[Install on windows](https://thingsboard.io/docs/user-guide/install/windows/#next-steps)


## Set language to English 

Click menu at top right > 账号 > 属性选项卡


## MQTT API

[MQTT API](https://thingsboard.io/docs/reference/mqtt-api/#getting-started)

### Server-side RPC

MUST add a dashboard for TERMINAL in Dashboards navigation in which it uses the widget  **RPC debug terminal**

## Configure device details dashboards in ThingsBoard Mobile Application

https://thingsboard.io/docs/mobile/device-dashboard/

### N-Configure a dashboard for device used in Flutter app

v3.9.1

Dashboard > Devices > Select a devices > Click Edit > Device profile > Mobile dashboard

## Build flutter app

### Environments

flutter-stable: 3.27.0  
jdk: 17  

### Build `.aab`

https://thingsboard.io/docs/mobile/release/


### Extract `.apk` from `.aab`



`keytool -genkeypair   -v   -keystore my-release-key.keystore   -alias my-key-alias   -keyalg RSA   -keysize 2048   -validity 10000`


https://github.com/google/bundletool/releases

`java -jar bundletool-all-1.18.1.jar build-apks   --bundle=app-release-mine.aab   --output=thingsboardapk-mine.apks   --ks=my-release-key.keystore   --ks-key-alias=my-key-alias   --ks-pass=pass:123456   --key-pass=pass:123456 --mode=universal`


java -jar bundletool-all-1.18.1.jar build-apks   --bundle=app-release.aab   --output=thingsboardapk-1.4.apks   --ks=my-release-key.keystore   --ks-key-alias=my-key-alias   --ks-pass=pass:123456   --key-pass=pass:123456 --mode=universal