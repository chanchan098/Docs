var heightDlBtn = 80
var widthDlBtn = 20
var dlCon = "j-dl-con"
var dlBg = "j-dl-btn-bg"
var dlId = "j-dl-btn"
var basicBtnStyle = 'width: 10px;position: fixed;top: 40px;right: 10px;background-color: rgb(179, 179, 179);color: rgb(249, 249, 249);border: none;cursor: pointer;text-align: center;line-height: 11px;padding: 5px 4px;border-radius: 5px;z-index: 9999 !important;'
var downloading = false


function uploadImage(base64, folderRoot, folder, filename, idx) {

    const formData = new FormData();
    formData.append('image', base64);
    formData.append('folderRoot', folderRoot)
    formData.append('folder', folder);
    formData.append('filename', filename);
    formData.append('idx', idx);


    GM_xmlhttpRequest({
        method: 'POST',
        url: UPLOAD_ADDR,
        data: formData,
        /*headers: { // 设置 Content-Type 为 multipart/form-data
            'Content-Type': undefined // GM_xmlhttpRequest 会自动处理 FormData 的 Content-Type
        },*/
        onload: function (response) {
            //console.log('Response:', response.responseText);
        },
        onerror: function (error) {
            console.error('Error:', error);
        }
    });

}

// upload
function startUpload() {
    if (downloading) {
        return
    }

    var obj = getInfosBySite()
    var imgs = obj.imgs
    var folderRoot = obj.folderRoot
    var folder = obj.folder
    console.log("imgs:", imgs.length);
    // reset
    downloading = true

    var curCount = 0
    var height = heightDlBtn
    var count = imgs.length
    var rate = height / count
    var bg = document.getElementById(dlBg)

    bg.style.top = heightDlBtn + 'px'

    setTimeout(() => {

        for (var i = 0; i < imgs.length; i++) {
            (function (i) {
                setTimeout(() => {
                    //console.log(i,imgs[i].src);
                    var img = imgs[i];
                    var ext = getImageExtension(img.src);
                    var fname = getFileNameAndExtension(img.src)

                    getImageBase64(img.src)
                        .then(base64 => {
                            console.log("curCount", curCount, imgs.length)
                            uploadImage(base64, folderRoot, folder, fname, i);


                            var curH = height - (curCount * rate)
                            bg.style.top = curH + 'px'

                            curCount = curCount + 1
                            // reset
                            if (curCount == imgs.length) {
                                downloading = false
                                bg.style.top = '0px'
                            }
                        })
                        .catch(error => {
                            console.error("Error:", error);
                            var curH = height - (curCount * rate)
                            bg.style.top = curH + 'px'

                            curCount = curCount + 1
                            // reset
                            if (curCount == imgs.length) {
                                downloading = false
                                bg.style.top = '0px'
                            }
                        });
                }, i * 10);
            })(i);
        }

    }, 500)

}


// START assistant
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
function arrayBufferToBase64(buffer) {
    const bytes = new Uint8Array(buffer);
    let binary = '';
    for (let i = 0; i < bytes.byteLength; i++) {
        binary += String.fromCharCode(bytes[i]);
    }
    return window.btoa(binary);
}
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
// END assistant


(function () {
    'use strict';

    /*getImageBase64("https://p3-xtjj-sign.byteimg.com/tos-cn-i-73owjymdk6/4ac64071a1594159b3cc08aa0909600b~tplv-73owjymdk6-jj-mark:0:0:0:0:q75.awebp?rk3s=f64ab15b&x-expires=1724290949&x-signature=bNwjUDy%2FbgcTjQVVLiMUFIKm%2B8g%3D") // 替换为实际图片URL
        .then(base64 => {
        console.log("Base64 Data:", base64);
    })
    .catch(error => {
        console.error("Error:", error);
    });*/

    var buttonCon = document.createElement('div');
    buttonCon.id = dlCon
    buttonCon.style = 'width: '+ widthDlBtn +'px;height: '+ heightDlBtn +'px;position: fixed;top: 40px;right: 10px;color: rgb(245 245 245);cursor: pointer;text-align: center;line-height: 11px;border-radius: 5px; border: 1px solid rgb(155 198 155);z-index: 999999 !important;overflow: hidden;'


    var buttonBg = document.createElement('div');
    buttonBg.id = dlBg
    buttonBg.style = 'width: 100%;height: 100%;background-color: rgb(179, 179, 179);border: none;cursor: pointer;border-radius: 2px;position: absolute;top: 0px;left: 0px;align-content: center;transition: top 0.2s ease;'


    var button = document.createElement('div');
    button.id = dlId
    button.textContent='down';
    button.style = 'width: 100%;height: 100%;border: none;cursor: pointer;text-align: center;line-height: 11px;border-radius: 5px;position: absolute;top: 0px;left: 0px;align-content: center;z-index: 10000 !important;text-orientation: upright;writing-mode: vertical-rl; font-size:12px !important'

    buttonCon.appendChild(buttonBg)
    buttonCon.appendChild(button)


    button.addEventListener('click', function () {
            startUpload()
        });

    document.body.appendChild(buttonCon);
})();
