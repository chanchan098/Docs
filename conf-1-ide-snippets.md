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
			"  "
		],
		"description": "break line"
	},
	"code block": {
		"prefix": "co",
		"body": [
			"```",
			"$1",
			"```",			
		],
		"description": "code block"
	},
	"code block ini": {
		"prefix": "coi",
		"body": [
			"```ini",
			"$1",
			"```",			
		],
		"description": "code block ini"
	},
	"code block JavaScript": {
		"prefix": "coj",
		"body": [
			"```javascript",
			"$1",
			"```",			
		],
		"description": "code block JavaScript"
	},
	"code block Java": {
		"prefix": "coja",
		"body": [
			"```java",
			"$1",
			"```",			
		],
		"description": "code block Java"
	},
	"code block docker": {
		"prefix": "cod",
		"body": [
			"```docker",
			"$1",
			"```",			
		],
		"description": "code block docker"
	},
	"code block shell": {
		"prefix": "cosh",
		"body": [
			"```shell",
			"$1",
			"```",			
		],
		"description": "code block shell"
	},
	"code block sql": {
		"prefix": "cos",
		"body": [
			"```sql",
			"$1",
			"```",			
		],
		"description": "code block sql"
	},
	"code block nginx": {
		"prefix": "con",
		"body": [
			"```nginx",
			"$1",
			"```",			
		],
		"description": "code block nginx"
	},

	"code block yaml": {
		"prefix": "coy",
		"body": [
			"```yaml",
			"$1",
			"```",			
		],
		"description": "code block nginx"
	},
	"code block mermaid": {
		"prefix": "com",
		"body": [
			"```mermaid",
			"$1",
			"```",			
		],
		"description": "code block mermaid"
	},
	"code block xml": {
		"prefix": "cox",
		"body": [
			"```xml",
			"$1",
			"```",			
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
			"$1",
			"",
			"</details>",			
		],
		"description": "diagram collapsed block"
	},
	"key concept": {
		"prefix": "k",
		"body": [
			"- $1  ",
			"  $2"
		],
		"description": "key concept"
	},
	"mark": {
		"prefix": "m",
		"body": [
			"<mark>$1</mark>"			
		],
		"description": "key concept"
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
			"**$1**  ",
			"  $2"
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
	}

}