# z-article-capturing.md

## Debugging chain of responsibility 

- executed as sorted in list

## To save as pdf

### Tools

|      comp | version | description             |
| --------: | :------ | ----------------------- |
|    python |         | script                  |
|   firefox |         | logining & reuse page   |
|  selenium |         | open controlled browser |
| pyautogui |         | automation              |


### Folder structure 

```yaml
folder
    files(pdf)
        resFolder
            resFiles
```

### Chain of responsibility by pyautogui

<span style='font-size: 15px;'>**Save pdf chain**</span>  
```mermaid
flowchart LR
    id[Ctrl + p] --> id2[selection to save pdf] --> id3[click save] --> id4[input folder and filename] --> id5[final saving]
```

<span style='font-size: 15px;'>**Save res file chain**</span>  
```mermaid
flowchart LR
    id[click download btn] --> id4[input folder and filename] --> id5[final saving]
```


### Diagram 

```mermaid
sequenceDiagram    
    activate UrlCapturing
    UrlCapturing-->>UrlCapturing: gets urls to articles
    UrlCapturing-->>UrlCapturing: gets urls to files(db, code, etc)
    UrlCapturing-->>UrlCapturing: builds folders and filenames
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

|             comp | version | description             |
| ---------------: | :------ | ----------------------- |
|           python |         | script                  |
|          firefox |         | logining & reuse page   |
|         selenium |         | open controlled browser |
|        pyautogui |         | automation              |
| coordination got |         | screen position         |
|        fscapture |         | scrolling capture       |

### Diagram 

```mermaid
sequenceDiagram    
    activate UrlCapturing
        UrlCapturing-->>UrlCapturing: gets urls to articles
        UrlCapturing-->>UrlCapturing: gets urls to files(db, code, etc)
        UrlCapturing-->>UrlCapturing: builds folders and filenames
        UrlCapturing-->>PyAutoGui: starts saving picture
    deactivate UrlCapturing

    loop each article
        PyAutoGui-->>FSCapture: shortcut, scrolling capture
        activate PyAutoGui
            activate FSCapture
            PyAutoGui-->>FSCapture: mouse, selects an area needed
        deactivate PyAutoGui
    
        FSCapture-->>FSCapture: starts scrolling

        loop for window popped up
        Python-->>FSCapture: listens whether done
        end
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
        
        opt resource file 
            activate PyAutoGui
                PyAutoGui-->>PyAutoGui: click download on browser or by python
                PyAutoGui-->>PyAutoGui: inputs foler & filename
                PyAutoGui-->>PyAutoGui: saves
            deactivate PyAutoGui
        end
    end
```
