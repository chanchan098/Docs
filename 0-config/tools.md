# tools.md

## free resources

- ssl, <https://letsencrypt.org/>
- ingress, <https://www.cpolar.com/>

## chrome tools

- AdBlock — 最佳广告拦截工具
- Dark Reader
- 知乎去除登录提示


## idea 2021.2.2 

to remove `configRoot/config/eval`

ctrl+shift+f, sougouinput

## linux

[env](https://blog.csdn.net/weixin_36296538/article/details/83044639)

## markdown on vscode

### usage for md preview enhanced

fix auto-jumping to preview and rendering error when edited on preview enhanced.

.settings.json
```json
{
    "workbench.editorAssociations": {
        "*.md": "default"
    },
  
}
```

0. to select a default text editor for all md files. 
   1. right click on a `.md` file
   2. click `open with` option
   3. select `Text Editor Active and Default`
1. open `settings` about md preview enhanced
   1. find out the `Preview mode`
   2. get the `Previews only`

### open preview default 

https://stackoverflow.com/questions/60155443/vscode-preview-markdown-by-default

`in settings.json`
```

"workbench.editorAssociations": {   
    "*.md": "vscode.markdown.preview.editor",
}


"workbench.editorAssociations": {
        "*.md": "markdown-preview-enhanced",
},


"markdown-preview-enhanced.previewMode": "Multiple Previews"
```




### mermaid chart

### markdown math

<https://freeopen.github.io/blog/mathjax>

### quick hints

open settings as json
```json
"[markdown]":{
        "editor.quickSuggestions": {
            "comments": "on",
            "strings": "on",
            "other": "on"
        }
    }
```

### vscode settings for markdown 

`.vscode/settings.json`

```json
{
    "workbench.colorTheme": "Visual Studio Light",
    "workbench.statusBar.visible": false,
    "workbench.layoutControl.type": "both",
    "workbench.activityBar.location": "top",
    "window.commandCenter": false
}
```


### plantuml on vscode

[tutorial](https://github.com/sxgic/plantumlforvscode/blob/master/%E5%A6%82%E4%BD%95%E5%9C%A8vscode%E4%B8%AD%E4%BD%BF%E7%94%A8PlantUML%E7%94%BBUML%E5%9B%BE.md#42-vscode-%E4%B8%AD%E5%AE%89%E8%A3%85-plantuml)

[use 2.11.2](https://github.com/qjebbs/vscode-plantuml/issues/255)

### markdown customized style

using `tags` and inner `style`
```html
<span style="">text</span>
```

### mardown emoji cheat sheet

<https://github.com/ikatyang/emoji-cheat-sheet>


### markdown custom css for preview

`C:\Users\116\.vscode\extensions`

`C:\Users\116\.vscode\extensions\shd101wyy.markdown-preview-enhanced-0.8.18\crossnote\styles\preview_theme`

## postman 

postman `joey4567@gmail.com`  
d ...


older than 10.17.0 can use scratch pad mode.

https://www.filehorse.com/download-postman/72677/


## ssh 

<https://blog.csdn.net/john1337/article/details/109465781>

root  
<https://blog.csdn.net/dmedaa/article/details/107992159>

## smargit 18.2.9 on Windows 

## sqlite update string

```sql
UPDATE users
SET email = REPLACE(email, '@example.com', '@newdomain.com')
WHERE email LIKE '%@example.com';
```

## tabby

### font jaggedness on light theme

<https://github.com/Eugeny/tabby/issues/8659>

## vscode plugins

### code tour

### drawio

### markdown emoji

### mermaid

### markdown all in one

### markdown preview enhanced 


## windows

### Boot apps when launched

`C:\Users\116\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup`

`%appdata%\Microsoft\Windows\Start Menu\Programs\Startup`

### wegestures

### everythingy

### huorong

### office 

https://zhuanlan.zhihu.com/p/629538463

### Input methods

https://bbs.pcbeta.com/viewthread-1859553-1-1.html