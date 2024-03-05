# z-article-capturing.md

## Debugging chain of responsibility 

- executed as sorted in list

## To save as pdf

### Tools

|comp|version|description
|---:|:---|---|
|python||script|
|firefox||logining & reuse page|
|selenium||open controlled browser|
|pyautogui||automation|


### Folder structure 

```json
[
    {
        "folder":"",
        "files":[
            {
                "url":"",
                "filename":"",
                "resFolder":"",
                "resFiles":[
                    {
                        "filename":"",
                        "url":""
                    }
                ]
            }
        ]
    }
]
```

### Diagram 

```mermaid
sequenceDiagram    
    activate UrlCapturing
    UrlCapturing-->>UrlCapturing: builds folders and filenames
    UrlCapturing-->>UrlCapturing: gets urls to articles
    UrlCapturing-->>UrlCapturing: gets urls to files(db, code, etc)
    UrlCapturing-->>PyAutoGui: starts saving file
    deactivate UrlCapturing

    loop every article
        activate PyAutoGui
        PyAutoGui-->>PyAutoGui: ctrl + p
        PyAutoGui-->>PyAutoGui: selects & saves as pdf
        PyAutoGui-->>PyAutoGui: inputs foler & filename
        PyAutoGui-->>PyAutoGui: saves
        opt 
            PyAutoGui-->>PyAutoGui: downloads res files or by python
            PyAutoGui-->>PyAutoGui: inputs foler & filename
            PyAutoGui-->>PyAutoGui: saves
        end
        deactivate PyAutoGui
    end
```

## To save as picture

### Tools

|comp|version|description
|---:|:---|---|
|python||script|
|firefox||logining & reuse page|
|selenium||open controlled browser|
|pyautogui||automation|
|coordination got||screen position|
|fscapture||scrolling capture|

### Diagram 

```mermaid
sequenceDiagram    
    activate UrlCapturing
        UrlCapturing-->>UrlCapturing: builds folders and filenames
        UrlCapturing-->>UrlCapturing: gets urls to articles
        UrlCapturing-->>UrlCapturing: gets urls to files(db, code, etc)
        UrlCapturing-->>PyAutoGui: starts saving picture
    deactivate UrlCapturing

    loop each article
        PyAutoGui-->>FSCapture: shortcut, scrolling capture
        activate PyAutoGui
            activate FSCapture
            PyAutoGui-->>FSCapture: mouse, selects an area needed
        deactivate PyAutoGui
    
        FSCapture-->>FSCapture: starts scrolling

        Python-->>FSCapture: listens whether done
        activate Python
            deactivate FSCapture
            Python-->>Python: if done
            Python-->>Python: from FSCapture window
            Python-->>PyAutoGui: shortcut: ctrl + c 
            activate PyAutoGui
            deactivate PyAutoGui
        
            Python-->>Python: pastes and writes picture to disk
            Python-->>PyAutoGui: shortcut: ctrl + w, close picture or window 
        deactivate Python
        
        opt
            activate PyAutoGui
                PyAutoGui-->>PyAutoGui: downloads res files or by python
                PyAutoGui-->>PyAutoGui: inputs foler & filename
                PyAutoGui-->>PyAutoGui: saves
            deactivate PyAutoGui
        end
    end
```
