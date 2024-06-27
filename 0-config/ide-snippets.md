# ide-snippets.md

mardown.json

```json
{
	// Place your snippets for markdown here. Each snippet is defined under a snippet name and has a prefix, body and 
	// description. The prefix is what is used to trigger the snippet and the body will be expanded and inserted. Possible variables are:
	// $1, $2 for tab stops, $0 for the final cursor position, and ${1:label}, ${2:another} for placeholders. Placeholders with the 
	// same ids are connected.
	// Example:
	// "Print to console": {
	// 	"prefix": "log",
	// 	"body": [
	// 		"console.log('$1');",
	// 		"$2"
	// 	],
	// 	"description": "Log output to console"
	// }
	"break line": {
		"prefix": "b",
		"body": [
			"<br/>"
		],
		"description": "break line"
	},
	"code block": {
		"prefix": "co",
		"body": [
			"```",
			"$1",
			"```",
			"",			
		],
		"description": "code block"
	},
	"code block ini": {
		"prefix": "coi",
		"body": [
			"```ini",
			"$1",
			"```",
			"",			
		],
		"description": "code block ini"
	},
	"code block JavaScript": {
		"prefix": "coj",
		"body": [
			"```javascript",
			"$1",
			"```",
			"",			
		],
		"description": "code block JavaScript"
	},
	"code block Java": {
		"prefix": "coja",
		"body": [
			"```java",
			"$1",
			"```",
			"",			
		],
		"description": "code block Java"
	},
	"code block docker": {
		"prefix": "cod",
		"body": [
			"```docker",
			"$1",
			"```",
			"",			
		],
		"description": "code block docker"
	},	
	"code block html": {
		"prefix": "coh",
		"body": [
			"```html",
			"$1",
			"```",
			"",			
		],
		"description": "code block html"
	},
	"code block shell": {
		"prefix": "cosh",
		"body": [
			"```shell",
			"$1",
			"```",
			"",			
		],
		"description": "code block shell"
	},
	"code block sql": {
		"prefix": "cos",
		"body": [
			"```sql",
			"$1",
			"```",
			"",			
		],
		"description": "code block sql"
	},
	"code block nginx": {
		"prefix": "con",
		"body": [
			"```nginx",
			"$1",
			"```",
			"",			
		],
		"description": "code block nginx"
	},

	"code block yaml": {
		"prefix": "coy",
		"body": [
			"```yaml",
			"$1",
			"```",
			"",			
		],
		"description": "code block nginx"
	},
	"code block mermaid": {
		"prefix": "com",
		"body": [
			"```mermaid",
			"$1",
			"```",
			"",			
		],
		"description": "code block mermaid"
	},
	"code block plantuml": {
		"prefix": "cop",
		"body": [
			"```plantuml",
			"@startuml"
			"$1",
			"@enduml"
			"```",
			"",			
		],
		"description": "code block plantuml"
	},
	"code block vue": {
		"prefix": "cov",
		"body": [
			"```vue",
			"$1",
			"```",
			"",			
		],
		"description": "code block vue"
	},
	"code block xml": {
		"prefix": "cox",
		"body": [
			"```xml",
			"$1",
			"```",
			"",			
		],
		"description": "code block xml"
	},
	"collapsed block": {
		"prefix": "dt",
		"body": [
			"<details>",
			"<summary>$1</summary>",
			"",
			"$2",
			"",
			"</details>",			
		],
		"description": "collapsed block"
	},
	"diagram collapsed block": {
		"prefix": "dd",
		"body": [
			"<details>",
			"<summary>Diagram</summary>",
			"",
			"![alt]($1)",
			"",
			"</details>",			
		],
		"description": "diagram collapsed block"
	},	
	"doc mark": {
		"prefix": "book",
		"body": [
			"📖"
		],
		"description": "doc mark"
	},
	"bookmark": {
		"prefix": "bm",
		"body": [
			"📑"
		],
		"description": "bookmark"
	},
	
	"key concept": {
		"prefix": "k",
		"body": [
			"- $1  ",
			"  $2"
		],
		"description": "key concept"
	},
	"left and right blocks": {
		"prefix": "lr",
		"body": [
		"<div style=\"display: flex;\">",
        "  <div style=\"flex: 1; padding-right: 20px;\">",
		"",
		"  <p><b>$1 &nbsp;</b></p>",
        "",
        "  $2",
        "",
        "  </div>",
        "  <div style=\"flex: 1;\">",
        "",
		"  <p><b>$3 &nbsp;</b></p>",
		""
        "  $4",
        "",
        "  </div>",
      	"</div>"
		],
		"description": "left and right blocks"
	},
	"mark": {
		"prefix": "m",
		"body": [
			"<mark>$1</mark>"			
		],
		"description": "key concept"
	},
	"next line": {
		"prefix": "n",
		"body": [
			"  "
		],
		"description": "next line"
	},	
	"other headings": {
		"prefix": "oh",
		"body": [
			"<font style=\"font-size:20px;\">$1</font>"			
		],
		"description": "greater than h2, other headings"
	},
	"sub heading": {
		"prefix": "sh",
		"body": [
			"<span style='font-size: 15px;'>**$1**</span>  ",
			"$2",
			""
		],
		"description": "sub heading"
	},
	"sub heading unordered": {
		"prefix": "shu",
		"body": [
			"<span style='font-size: 15px;'>**$1**</span>  ",
			"-$2"
		],
		"description": "sub heading unordered"
	},
	"task": {
		"prefix": "ts",
		"body": [
			"- [ ] $1",		
		],
		"description": "task"
	},
	"task done": {
		"prefix": "tsd",
		"body": [
			"- [x] $1",		
		],
		"description": "task done"
	},
	"under line": {
		"prefix": "ul",
		"body": [
			"<u>$1</u>",
		],
		"description": "under line"
	},
	"under writing": {
		"prefix": "writ",
		"body": [
			"📝",
		],
		"description": "under writing"
	}
}
```