| gear  | range | gear up at | dest  | gear down at | target |
| :---: | :---: | :--------: | :---: | :----------: | :----: |
|   1   | 00-20 |    #15+    |  +2   |              |
|   2   | 05-30 |    #25+    |  +3   |     10-      |   -1   |
|   3   | 15-40 |    #35+    |  +4   |     20-      |   -2   |
|   4   | 25-50 |    #45+    |  +5   |     30-      |   -3   |
|   5   | 35-60 |            |       |     40-      |   -4   |

https://www.yoojia.com/wenda/597250.html?fromtype=top1

### State conversion when driving

```mermaid
flowchart LR
    subgraph SpeedsControl
    direction LR
    3[stable] <--> UpDown
    
        subgraph UpDown
            direction TB
            1[gear up] <--> 2[gear down]
        end
    end

    subgraph Attention
        de <--> Watching
        subgraph de[Distance evaluation]
            direction BT
            de2[distance evaluation] --> objects & knots
        end
        subgraph Watching
            direction TB
            watching --> windows & mirrors & pannels
        end
    end

    Attention <--> SpeedsControl
```


### Environment evaluation

