# cmp-14-vue3.md

# Scaffold

## nodejs

## debugger

* vscode 
* chrome extension of vue.js devtools

## Ts

* [ts](https://www.tslang.cn/docs/handbook/basic-types.html)
* [doc tsconfig-json](https://www.tslang.cn/docs/handbook/tsconfig-json.html)

## npm

* [doc npm](https://docs.npmjs.com/)
* [doc package.json](https://docs.npmjs.com/cli/v10/configuring-npm/package-json)
* [doc npm configurations](https://docs.npmjs.com/cli/v10/using-npm/config)

---

* [package.json](package.json)
* [doc script block](https://docs.npmjs.com/cli/v10/using-npm/scripts)

## sass

* [doc](https://sass-lang.com/documentation/syntax/)

## [vue cli](https://cli.vuejs.org/zh/guide/)

## [vite](https://cn.vitejs.dev/guide)

## [vue router 4.x](https://router.vuejs.org/zh/guide/)

## [vue3](https://cn.vuejs.org/guide/introduction.html)

### modularization thought

```
        R                   C
       / \                 / \ 
      A   B               K   I
    /  \   \            /   \     
   □    C   □          Y     X
```


### [api ref](https://cn.vuejs.org/api/)

### [single file component](https://cn.vuejs.org/guide/scaling-up/sfc.html)
* [example](src\views\system\user\index.vue)

### watcher

* [doc](https://vuejs.org/guide/essentials/watchers.html)
* [use](src\views\mall\product\spu\form\ProductAttributes.vue#L75)

### props

* [doc](https://cn.vuejs.org/guide/essentials/component-basics.html#passing-props)

### slot

* [doc](https://cn.vuejs.org/guide/components/slots.html#slot-content-and-outlet)

#### custom events

* [doc](https://cn.vuejs.org/guide/essentials/component-basics.html#listening-to-events)

### [custom components](src\components)



* [doc](https://cn.vitejs.dev/guide/env-and-mode.html)

### [element ui plus](https://element-plus.org/zh-CN/guide/design.html)

# Essentials

# Template Syntax

## Text Interpolation

```html
<span>Message: {{ msg }}</span>
```

## Raw HTML

to use the v-html directive:
```html
<p>Using text interpolation: {{ rawHtml }}</p>
<p>Using v-html directive: <span v-html="rawHtml"></span></p>
```

## Attribute Bindings

use a v-bind directive:
```html
<div v-bind:id="dynamicId"></div>
```

If the bound value is null or undefined, then the attribute will be removed from the rendered element.

### Shorthand

```html
<div :id="dynamicId"></div>
```

### Same-name Shorthand `3.4+`

```html
<!-- same as :id="id" -->
<div :id></div>

<!-- this also works -->
<div v-bind:id></div>
```

### Boolean Attributes

```html
<button :disabled="isButtonDisabled">Button</button>
```

### Dynamically Binding Multiple Attributes

multiple attributes
```html
const objectOfAttrs = {
  id: 'container',
  class: 'wrapper'
}
```

using v-bind without an argument:
```html
<div v-bind="objectOfAttrs"></div>
```

## Using JavaScript Expressions

```html
{{ number + 1 }}

{{ ok ? 'YES' : 'NO' }}

{{ message.split('').reverse().join('') }}

<div :id="`list-${id}`"></div>
```

In Vue templates, JavaScript expressions can be used in the following positions:

- Inside text interpolations (mustaches)
- In the attribute value of any Vue directives (special attributes that start with v-)

### Calling Functions

It is possible to call a component-exposed method inside a binding expression:
```html
<time :title="toTitleDate(date)" :datetime="date">
  {{ formatDate(date) }}
</time>
```

### Restricted Globals Access

Template expressions are sandboxed and only have access to `a restricted list of globals`.

## Directives

Directives are special attributes with the v- prefix.

A directive's job is to reactively apply updates to the DOM when the value of its expression changes.
```html
<p v-if="seen">Now you see me</p>
```
Here, the v-if directive would remove / insert the <p> element based on the truthiness of the value of the expression seen.

### Arguments

Some directives can take an "argument", denoted by a colon after the directive name.  

For example, the `v-bind` directive is used to reactively update an HTML attribute:
```html
<a v-bind:href="url"> ... </a>

<!-- shorthand -->
<a :href="url"> ... </a>
```

Here, href is the argument, 


Another example is the `v-on` directive, which listens to DOM events:
```html
<a v-on:click="doSomething"> ... </a>

<!-- shorthand -->
<a @click="doSomething"> ... </a>
```
Here, the argument is the event name to listen to: click.  
v-on has a corresponding shorthand, namely the `@` character.

### Dynamic Arguments

in a directive argument
```html
<!--
Note that there are some constraints to the argument expression,
as explained in the "Dynamic Argument Value Constraints" and "Dynamic Argument Syntax Constraints" sections below.
-->
<a v-bind:[attributeName]="url"> ... </a>

<!-- shorthand -->
<a :[attributeName]="url"> ... </a>
```

Similarly, you can use dynamic arguments to bind a handler to a dynamic event name:
```html
<a v-on:[eventName]="doSomething"> ... </a>

<!-- shorthand -->
<a @[eventName]="doSomething"> ... </a>
```

In this example, when eventName's value is "focus", v-on:[eventName] will be equivalent to v-on:focus.

### Dynamic Argument Value Constraints

with the exception of **null**. The special value **null** can be used to explicitly remove the binding. Any other **non-string** value will trigger a warning.

### doc-Dynamic Argument Syntax Constraints

For example, the following is invalid:
```html
<!-- This will trigger a compiler warning. -->
<a :['foo' + bar]="value"> ... </a>
```

## Modifiers

which indicate that a directive should be bound in some special way. 

For example, the `.prevent` modifier tells the `v-on` directive to call `event.preventDefault()` on the triggered event:
```html
<form @submit.prevent="onSubmit">...</form>
```

# Lifecycle Hooks


# Scaling Up

# Single-File Components

## Introduction

Vue Single-File Components (a.k.a. *.vue files, abbreviated as SFC) is a special file format  
that allows us to encapsulate the template, logic, and styling of a Vue component in a single file.  

Here's an example SFC:
```html
<script setup>
import { ref } from 'vue'
const greeting = ref('Hello World!')
</script>

<template>
  <p class="greeting">{{ greeting }}</p>
</template>

<style>
.greeting {
  color: red;
  font-weight: bold;
}
</style>
```

The full syntax is defined in the [SFC Syntax Specification](https://vuejs.org/api/sfc-spec.html).

