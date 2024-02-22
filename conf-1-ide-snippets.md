# conf-1-ide-snippets.md

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

	"code block": {
		"prefix": "co",
		"body": [
			"```",
			"$1",
			"```",			
		],
		"description": "code block"
	},
	"code block mermaid": {
		"prefix": "cm",
		"body": [
			"```mermaid",
			"$1",
			"```",			
		],
		"description": "code block mermaid"
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
	"sub heading": {
		"prefix": "sh",
		"body": [
			"- **$1**  ",
			"  $2"
		],
		"description": "sub heading"
	}

}
```