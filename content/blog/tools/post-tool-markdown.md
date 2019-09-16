+++
author = "Markdown Cheatsheet"
categories = ["Markdown", "Herramientas"]
date = "2019-06-01"
description = "Breve guía para utilizar esta herramientas y crear documentos en formato .md"
featured = "markdown.jpg"
featuredalt = ""
featuredpath = "date"
linktitle = ""
title = "Guía para usar Markdown"
type = "post"

+++

Markdown es una herramienta de escritura que es utilizada generalmente para hacer la conversión de texto plano a HTML. Tiene una forma de escribir bastante sencilla y debido a que es texto plano, siempre mantiene un diseño legible y compatible con todas las plataformas o aplicaciones en cualquier dispositivo.

A continuación dejo ejemplos de como utilizar Markdown.

---
Agradecimientos especiales a [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet).

## Títulos

# H1
## H2
### H3
#### H4
##### H5
###### H6

Alt-H1
======

Alt-H2
------

```
# H1
## H2
### H3
#### H4
##### H5
###### H6

Alt-H1
======

Alt-H2
------
```

---
## Formatos de letra

Emphasis, aka italics, with *asterisks* or _underscores_.

Strong emphasis, aka bold, with **asterisks** or __underscores__.

Combined emphasis with **asterisks and _underscores_**.

Strikethrough uses two tildes. ~~Scratch this.~~

```
Emphasis, aka italics, with *asterisks* or _underscores_.

Strong emphasis, aka bold, with **asterisks** or __underscores__.

Combined emphasis with **asterisks and _underscores_**.

Strikethrough uses two tildes. ~~Scratch this.~~
```

---
## Listas

1. First ordered list item
2. Another item
  * Unordered sub-list.
1. Actual numbers don't matter, just that it's a number
  1. Ordered sub-list
4. And another item.

```
1. First ordered list item
2. Another item
  * Unordered sub-list.
1. Actual numbers don't matter, just that it's a number
  1. Ordered sub-list
4. And another item.
```

---
## Links

[I'm an inline-style link.](https://www.google.com)

[I'm an inline-style link with title.](https://www.google.com "Google's Homepage")

[I'm a reference-style link.][Arbitrary case-insensitive reference text]

[I'm a relative reference to a repository file.](../blob/master/LICENSE)

[You can use numbers for reference-style link definitions.][1]

Or leave it empty and use the [link text itself].

URLs and URLs in angle brackets will automatically get turned into links.
http://www.example.com or <http://www.example.com> and sometimes
example.com (but not on Github, for example).

Some text to show that the reference links can follow later.

[arbitrary case-insensitive reference text]: https://www.mozilla.org
[1]: http://slashdot.org
[link text itself]: http://www.reddit.com

```
[I'm an inline-style link.](https://www.google.com)

[I'm an inline-style link with title.](https://www.google.com "Google's Homepage")

[I'm a reference-style link.][Arbitrary case-insensitive reference text]

[I'm a relative reference to a repository file.](../blob/master/LICENSE)

[You can use numbers for reference-style link definitions.][1]

Or leave it empty and use the [link text itself].

URLs and URLs in angle brackets will automatically get turned into links.
http://www.example.com or <http://www.example.com> and sometimes
example.com (but not on Github, for example).

Some text to show that the reference links can follow later.

    [arbitrary case-insensitive reference text]: https://www.mozilla.org
    [1]: http://slashdot.org
    [link text itself]: http://www.reddit.com
```

---
## Imágenes desde fuentes externas

Inline-style:
![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 1")

Reference-style:
![alt text][logo]

[logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 2"

```
Inline-style:
![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 1")

Reference-style:
![alt text][logo]

[logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Logo Title Text 2"
```

---
## Código

Inline `code` has `back-ticks around` it.

```javascript
var s = "JavaScript syntax highlighting";
alert(s);
```

```python
s = "Python syntax highlighting"
print s
```

```
No language indicated, so no syntax highlighting.
But let's throw in a <b>tag</b>.
```

```
    Inline `code` has `back-ticks around` it.

    ```javascript
    var s = "JavaScript syntax highlighting";
    alert(s);
    ```

    ```python
    s = "Python syntax highlighting"
    print s
    ```

    ```
    No language indicated, so no syntax highlighting.
    But let's throw in a <b>tag</b>.
    ```
    ```
```

---
## Tablas

Colons can be used to align columns.

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |

There must be at least 3 dashes separating each header cell.
The outer pipes (|) are optional, and you don't need to make the
raw Markdown line up prettily. You can also use inline Markdown.

Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3

```
Colons can be used to align columns.

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |

There must be at least 3 dashes separating each header cell.
The outer pipes (|) are optional, and you don't need to make the
raw Markdown line up prettily. You can also use inline Markdown.

Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3
```

---
## Citas
> Blockquotes are very handy in email to emulate reply text.
> This line is part of the same quote.

Quote break.

> This is a very long line that will still be quoted properly when it wraps. Oh boy let's keep writing to make sure this is long enough to actually wrap for everyone. Oh, you can *put* **Markdown** into a blockquote.

```
> Blockquotes are very handy in email to emulate reply text.
> This line is part of the same quote.

Quote break.

> This is a very long line that will still be quoted properly when it wraps. Oh boy let's keep writing to make sure this is long enough to actually wrap for everyone. Oh, you can *put* **Markdown** into a blockquote.
```
---
## Imágenes

{{< fancybox path="/img/2014/04" file="pic01.jpg" caption="Caption 1" gallery="Gallery Name" >}}

{{< fancybox "/img/2014/04" "pic02.jpg" "Caption 2" "Gallery Name" >}}

{{< fancybox "/img/2014/09" "pic03.jpg" "Caption 3" "Gallery Name" >}}

```
{{</* fancybox path="/img/2014/04" file="pic01.jpg" caption="Caption 1" gallery="Gallery Name" */>}}

{{</* fancybox path="/img/2014/04" "pic02.jpg" caption="Caption 2" "Gallery Name" */>}}

{{</* fancybox "/img/2014/09" "pic03.jpg" "Caption 3" "Gallery Name" */>}}
```
