
f12
https://blog.csdn.net/sonichty/article/details/106337097  
https://www.cnblogs.com/jinyuu/p/11590343.html

cros
https://blog.csdn.net/shaoming314/article/details/113937467

## Types of advertisement for browser

### static html content

just make them `display: none` by some like `Adblock` plugins

### interactive html content

when browsing content its are bumped up on screen, via some events in tampermonkey to close its like `scroll` or `loaded`

<details>
<summary>code</summary>

```javascript
// ==UserScript==
// @name         testing
// @namespace    https://google.com/
// @version      0.1.0
// @description  testing
// @author       none
// @run-at       document-start
// @match        https://www.baidu.com/*
// @match        https://juejin.cn/
// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    //document.write('<div style="color: red; font-size: 64px;">test</div>');
    //window.stop();

    var event = ()=>{
    // 获取当前的滚动位置
    let scrollTop = window.pageYOffset || document.documentElement.scrollTop;

        // 输出滚动位置
        console.log('页面滚动位置:', scrollTop);
        var con1 = document.getElementsByClassName("entry-list-wrap")[0]
        var titles = con1.getElementsByClassName("title-row")
        var last = titles[titles.length-1]
        console.log(last.innerText)

    }
    // 返回上一页
    //history.back();
    window.addEventListener('scroll', event);

    /*window.addEventListener('click',()=>{
        const xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function() {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    console.log(xhr.responseText)
                } else {
                    console.error('There was a problem with the request:', xhr.status);
                }
            }
        };

        xhr.open('GET', 'http://localhost:3001/timer/?hoursStarted=8&minutesStarted=47&hoursEnded=18&minutesEnded=10&minutesNoonEnded=16', true);
        //xhr.open('GET', 'https://juejin.cn/', true);
        xhr.send();
    });*/




})();
```

</details>


### script actions

intercept its 

tampermonkey


## scripts

### long press

<details>
<summary></summary>

```javascript
// 变量用于跟踪鼠标是否按下
let isMouseDown = false;
let longPressTimeout;

// 长按时触发的函数
function handleLongPress() {
  console.log("Long press detected!");
  // 清除计时器，防止重复触发
  clearTimeout(longPressTimeout);
}

// 鼠标按下时的处理函数
function handleMouseDown() {
  // 设置一个计时器，如果持续时间超过一定阈值，则触发长按事件
  longPressTimeout = setTimeout(handleLongPress, 500); // 500毫秒后触发长按
  isMouseDown = true;
}

// 鼠标释放时的处理函数
function handleMouseUp() {
  // 清除计时器，防止触发长按
  clearTimeout(longPressTimeout);
  isMouseDown = false;
}

// 添加事件监听器
window.addEventListener('mousedown', handleMouseDown);
window.addEventListener('mouseup', handleMouseUp);

// 为了兼容移动设备，还可以监听 touchstart 和 touchend 事件
window.addEventListener('touchstart', handleMouseDown);
window.addEventListener('touchend', handleMouseUp);
```


</details>


### prevent jumping when `F12`

<details>
<summary></summary>

```javascript
// ==UserScript==
// @name         testing
// @namespace    https://google.com/
// @version      0.1.0
// @description  testing
// @author       none
// @run-at       document-idle
// @match        https://duckduckgo.com/*
// @grant        none
// ==/UserScript==


(function() {
    'use strict';
    //prevent jumping
    javascript:window.addEventListener('beforeunload', function (e) { e.preventDefault();e.returnValue = '' });


})();
```


</details>


### prevent go ahead

<details>
<summary></summary>

```javascript
// ==UserScript==
// @name         prevent go ahead
// @namespace    http://tampermonkey.net/
// @version      2024-08-15
// @description  try to take over the world!
// @author       You
// @match        https://duckduckgo.com/
// @run-at       document-start

// @grant        none
// ==/UserScript==

(function() {
    'use strict';
    window.stop();
    history.back();
    // Your code here...
})();
```


</details>


### get imgs

<details>
<summary></summary>

```javascript
// ==UserScript==
// @name         testing
// @namespace    https://google.com/
// @version      0.1.0
// @description  testing
// @author       none
// @run-at       document-idle
// @match        https://www.baidu.com/*
// @match        https://juejin.cn/post/*
// @match        http://www.netbian.com/*
// @grant        GM_xmlhttpRequest
// @require      https://raw.githubusercontent.com/chanchan098/Docs/master/tools/get-infos-by-site.js
// ==/UserScript==

const UPLOAD_ADDR = "http://192.168.0.116:7777/upload";

// for specific website
/*function getInfosBySite(){
   //var imgs = document.getElementsByTagName("img")
    const currentUrl = window.location.href;
    console.log("Current Page URL:", currentUrl);

    // 如果需要处理URL中的特定部分，可以使用URL API
    // const url = new URL(currentUrl);
    // console.log("Hostname:", url.hostname);
    // console.log("Pathname:", url.pathname);
    // console.log("Search Params:", url.search);

    if(currentUrl.indexOf('juejin.cn/post') != -1){
        var articleA = document.getElementsByClassName('article-area')[0];

        var at = articleA.getElementsByTagName("article")[0];
        var title = document.getElementsByClassName('article-title')[0];

        var imgs = at.getElementsByTagName("img");
        var folderRoot = "D:\\liaoyj\\test\\juejin\\";
        var folder = title.innerText;

        return {imgs, folderRoot, folder};
    }
    else if(currentUrl.indexOf('www.netbian.com/index') != -1){
        var list = document.getElementsByClassName('list')[0];
        var imgs = list.getElementsByTagName("img");

        var page = document.getElementsByClassName("page")[0];
        var curPage = page.getElementsByTagName("b")[0];
        var folderRoot = "D:\\liaoyj\\test\\bian\\";
        var folder = curPage.innerText;



        return {imgs, folderRoot, folder}
    }
}

*/


function getImageExtension(url) {
    // 去掉URL片段部分（#号后面的内容）
    const urlWithoutFragment = url.split('#')[0];

    // 去掉URL参数部分（?号后面的内容）
    const urlWithoutParams = urlWithoutFragment.split('?')[0];

    // 提取文件的后缀名
    const extension = urlWithoutParams.split('.').pop();

    // 检查提取的内容是否是一个合理的后缀名（长度应小于5，且只包含字母）
    if (extension.length > 0 && extension.length <= 5 && /^[a-zA-Z]+$/.test(extension)) {
        return extension;
    } else {
        return ''; // 返回空字符串表示没有找到有效的后缀名
    }
}


function getFileNameAndExtension(url) {
    // 去掉URL片段部分（#号后面的内容）
    const urlWithoutFragment = url.split('#')[0];

    // 去掉URL参数部分（?号后面的内容）
    const urlWithoutParams = urlWithoutFragment.split('?')[0];

    // 提取文件名和后缀名部分
    const parts = urlWithoutParams.split('/');
    const fileNameWithExtension = parts.pop();

    // 拆分文件名和后缀名
    const fileNameParts = fileNameWithExtension.split('.');
    const extension = fileNameParts.pop(); // 获取后缀名
    const fileName = fileNameParts.join('.'); // 获取文件名

    // 检查提取的内容是否是一个合理的后缀名（长度应小于5，且只包含字母）
    if (extension.length > 0 && extension.length <= 8 && /^[a-zA-Z]+$/.test(extension)) {
        return fileName + '.' + extension;
    } else {
        return ""; // 返回空字符串表示没有找到有效的后缀名
    }
}


function uploadImage(base64, folderRoot, folder, filename, idx) {
    // 假设我们已经有了一个 Blob 对象，它代表了图片数据


    // 创建 FormData 对象
    const formData = new FormData();
    formData.append('image', base64); // 第三个参数是文件名
    formData.append('folderRoot', folderRoot)
    formData.append('folder', folder);
    formData.append('filename', filename);
    formData.append('idx', idx);

    // 创建 XMLHttpRequest 实例
    const xhr = new XMLHttpRequest();
    // 设置请求的 URL 和类型
    xhr.open('POST', UPLOAD_ADDR, true);

    // 设置请求头，告诉服务器我们将发送一个 Blob
    //xhr.setRequestHeader('Content-Type', 'multipart/form-data');



    // 设置响应处理函数
    xhr.onload = function () {
        if (xhr.status === 200) {
            //console.log('Image uploaded successfully.');
            //console.log('Server response:', xhr.responseText);
        } else {
            console.log(filename)
            console.error('Failed to upload image. Status:', xhr.status);
        }
    };

    // 发送 FormData
    xhr.send(formData);
}


/**
 * 将ArrayBuffer转换为Base64编码
 * @param {ArrayBuffer} buffer
 * @return {string} Base64编码
 */
function arrayBufferToBase64(buffer) {
    const bytes = new Uint8Array(buffer);
    let binary = '';
    for (let i = 0; i < bytes.byteLength; i++) {
        binary += String.fromCharCode(bytes[i]);
    }
    return window.btoa(binary);
}

/**
    * 获取图片的Base64编码
    * @param {string} url - 图片的URL
    * @return {Promise<string>} - Promise对象，解析为Base64编码的字符串
    */
function getImageBase64(url) {
    return new Promise((resolve, reject) => {
        GM_xmlhttpRequest({
            method: "GET",
            url: url,
            responseType: "arraybuffer", // 以ArrayBuffer格式接收响应
            onload: function (response) {
                try {
                    const base64 = arrayBufferToBase64(response.response);
                    resolve(base64);
                } catch (error) {
                    reject("Failed to convert image to Base64: " + error.message);
                }
            },
            onerror: function (error) {
                reject("Request failed: " + error.message);
            }
        });
    });
}


function handleMouseDown() {
    // 设置一个计时器，如果持续时间超过一定阈值，则触发长按事件
    longPressTimeout = setTimeout(handleLongPress, 600); // 500毫秒后触发长按
    isMouseDown = true;
}

function handleMouseUp() {
    // 清除计时器，防止触发长按
    clearTimeout(longPressTimeout);
    isMouseDown = false;
}


let isMouseDown = false;
let longPressTimeout;

// upload
function handleLongPress() {
    //var imgs = document.getElementsByTagName("img")
    //console.log("Long press detected!", imgs.length);

    //var folder = "D:\\liaoyj\\test\\"
    //var ext2 = getImageExtension(imgs[0].src)
    var obj = getInfosBySite()
    var imgs = obj.imgs
    var folderRoot = obj.folderRoot
    var folder = obj.folder

    console.log("imgs:", imgs.length);
    document.getElementsByTagName("body")[0].style = "opacity:0.2;transition: opacity .5s ease-in-out;"
    setTimeout(()=>{ document.getElementsByTagName("body")[0].style = "opacity:1;transition: opacity .5s ease-in-out;" }, 500)


    setTimeout(()=>{
        for (var i = 0; i < imgs.length; i++) {
        (function (i) {
            setTimeout(() => {
                //console.log(i,imgs[i].src);
                var img = imgs[i];
                var ext = getImageExtension(img.src);
                var fname = getFileNameAndExtension(img.src)

                getImageBase64(img.src) // 替换为实际图片URL
                    .then(base64 => {
                    uploadImage(base64, folderRoot, folder, fname, i);
                })
                    .catch(error => {
                    console.error("Error:", error);
                });
            }, i * 100);
        })(i);
    }
    },1000)
    // 清除计时器，防止重复触发
    clearTimeout(longPressTimeout);
}


(function () {
    'use strict';

    /*getImageBase64("https://p3-xtjj-sign.byteimg.com/tos-cn-i-73owjymdk6/4ac64071a1594159b3cc08aa0909600b~tplv-73owjymdk6-jj-mark:0:0:0:0:q75.awebp?rk3s=f64ab15b&x-expires=1724290949&x-signature=bNwjUDy%2FbgcTjQVVLiMUFIKm%2B8g%3D") // 替换为实际图片URL
        .then(base64 => {
        console.log("Base64 Data:", base64);
    })
    .catch(error => {
        console.error("Error:", error);
    });*/

    // 添加事件监听器
    window.addEventListener('mousedown', handleMouseDown);
    window.addEventListener('mouseup', handleMouseUp);

    // 为了兼容移动设备，还可以监听 touchstart 和 touchend 事件
    window.addEventListener('touchstart', handleMouseDown);
    window.addEventListener('touchend', handleMouseUp);

})();
```


</details>