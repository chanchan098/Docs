# scss


###################################################################

# unocss
https://unocss.dev/guide/

https://unocss.nodejs.cn/guide/

## -Guide

## Getting Started

### What is UnoCSS?

UnoCSS is the instant atomic CSS engine, that is designed to be flexible and extensible. The core is un-opinionated and all the CSS utilities are provided via presets.


## preset

[presets](https://unocss.dev/guide/presets) 

[search presets](https://unocss.dev/interactive)

## Tailwindcss

https://tailwindcss.com/



## Examples

located at `yudao-ui-admin-vue3\uno.config.ts`

### exp1

```typescript
[
      /^custom-hover$/,
      ([], { rawSelector }) => {
        const selector = e(rawSelector)
        return `
                ${selector} {
                  display: flex;
                  height: 100%;
                  padding: 1px 10px 0;
                  cursor: pointer;
                  align-items: center;
                  transition: background var(--transition-time-02);
                }
                /* you can have multiple rules */
                ${selector}:hover {
                  background-color: var(--top-header-hover-color);
                }
                .dark ${selector}:hover {
                  background-color: var(--el-bg-color-overlay);
                }
              `
      }
    ]
```

used at
```html
<div v-else class="custom-hover" @click.stop="showTopSearch = !showTopSearch">
...
```



compiled to 

```CSS
/* layer: default */

.custom-hover {
  display: flex;
  height: 100%;
  padding: 1px 10px 0;
  cursor: pointer;
  align-items: center;
  transition: background var(--transition-time-02);
}
/* you can have multiple rules */
.custom-hover:hover {
  background-color: var(--top-header-hover-color);
}
.dark .custom-hover:hover {
  background-color: var(--el-bg-color-overlay);
}
```





#################################################################

# -postcss

A tool for transforming CSS with JavaScript

https://postcss.org/
