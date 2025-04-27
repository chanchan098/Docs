## Retrieving uitree

https://github.com/alexal1/Insomniac/wiki/UI-Automator-Viewer:-What-Is-It-And-How-To-Use-It

## Decompile by JEB

## Find resource by id


HomeFragment

com.myhexin.reface.biz.home_v2

---

`smali\com\dreamapp\dubhe\R$id.smali`

`smali\com\dreamapp\dubhe\R$layout.smali`

## Find home recyclerview 

A data recyclerview `TemplateListCard`, find by id `rv_templates` value


By searching in code  
Discovered `adapter` com.myhexin.reface.biz.home_v2.detail.OooOOO0 

Super class of this `adapter` com.myhexin.reface.biz.home_v2.detail.OooOOO 

BaseAdapter o0000o0O.OooOO0

---

Container recyclerview `rv_content`

## Home recyclerview data loading

com.myhexin.reface.biz.home_v2.HomeModelV4
```java
public final void OoooOOO(int v, boolean z, boolean z1) {
    CoroutineExKt.OooO0O0(ViewModelKt.getViewModelScope(this), null, null, null, new HomeModelV4.switchToNewTab.1(v, this, z, z1, null), 7, null);
}
```

called at `com.myhexin.reface.biz.home_v2.HomeFragmentV4`
```java
integer0 = oo0o0Oo0.OooOo0.getSelectedTabPosition();

//...

int v = integer0.intValue();
((HomeModelV4)this.o000oOoO()).OoooOOO(v, true, true);
```


## okhttp client

class `okhttp3.o0Oo0oo`

newCall
```java
@Override  // okhttp3.OooO$OooO00o
public OooO OooO00o(o0OO00O o0OO00O0) {
    oo000o.OooO0o(o0OO00O0, "request");
    return new okhttp3.internal.connection.OooO(this, o0OO00O0, false);
}
```

### Call interface

execute
```java
o0O0O00 execute() throws IOException;
```


enqueue
```java
void Oooo00O(OooOO0 arg1);
```

### RealCall

`okhttp3.internal.connection.OooO`


### Request 

class `okhttp3.o0OO00O`

### Response

class `okhttp3.o0O0O00`


### ResponseBody

object `response.OooOOO0`

## retrofit package

api located here

smali_classes4\o00o0o00


## Interceptors

smali_classes3\com\myhexin\base\retrofit\interceptor\


## Token generation no need

com.myhexin.base.retrofit.interceptor.OooO00o


## Debug webview

### Frida hook

```javascript

function hookWebview() {
    setTimeout(function () {
        Java.perform(function () {

            var WebView = Java.use("android.webkit.WebView");
            var Handler = Java.use("android.os.Handler");
            var Looper = Java.use("android.os.Looper");

            var handler = Handler.$new(Looper.getMainLooper());

            handler.post(Java.registerClass({
                name: 'com.example.MyRunnable',
                implements: [Java.use('java.lang.Runnable')],
                methods: {
                    run: function () {
                        try {
                            WebView.setWebContentsDebuggingEnabled(true);
                            console.log("✅ 成功在主线程开启 WebView 调试");
                        } catch (e) {
                            console.error("❌ 设置失败：" + e);
                        }
                    }
                }
            }).$new());
        
        })
    }, 5000);

            
    // setTimeout(() => {
    //     Java.perform(function () {
    //         //枚举所有的类与类的所有方法,异步枚举
    //         Java.enumerateLoadedClasses({
    //             onMatch: function (name, handle) {
    //                 //过滤类名

    //                 if (name.indexOf("WebView") != -1) {
    //                     console.log(name);

    //                 }
    //             },
    //             onComplete: function () {

    //             }
    //         })
    //     })
    // }, 8000)
}


setImmediate(hookWebview)

setInterval(function () { }, 1000);
```



chrome://inspect/#devices

## Api

User-Agent: okhttp/4.12.0

### get_content_list

https://aidreamface.com/df-server/home_v4/get_content_list


- user_id
  - MUST, can be a random value

```javascript
{
    "last_template_id": "",
    "scene": {
        "type": 20,
        "category_id": "67404aa8a97a7000072c7e15",
        "category_name": "PET"
    },
    "size": 5,
    "user_id": "a3b1d9f240c75d8e",
    "timestamp": "1745464499848",
    "token": "cad9c3412f5d8f13c3d004b256987a26",
    "platform_type": "ANDROID",
    "app_version": "5.1.0",
    "app_type": "dreamface_free",
    "language": "zh"
}
```

