# Markdown Syntax Test

## Headers

# H1 Header

## H2 Header

### H3 Header

#### H4 Header

##### H5 Header

###### H6 Header

## Text Formatting

**Bold text** and _italic text_ and **_bold italic_**

~~Strikethrough text~~

`inline code` and regular text

## Lists

### Unordered List

- Item 1
- Item 2
  - Nested item 2.1
  - Nested item 2.2
    - Deep nested item
- Item 3

### Ordered List

1. First item
2. Second item
3. Third item
   1. Nested numbered
   2. Another nested

### Task List

- [x] Completed task
- [ ] Pending task
- [ ] Another pending task

## Links and Images

[Link to Google](https://google.com)

[Link with title](https://github.com "GitHub Homepage")

## Blockquotes

> This is a blockquote
> It can span multiple lines
>
> And have multiple paragraphs

> Nested quote
>
> > Double nested quote

## Code Blocks

```python
def hello_world():
    print("Hello, World!")
    return True
```

```javascript
const greet = (name) => {
  console.log(`Hello, ${name}!`);
};
```

```bash
echo "Testing bash syntax"
ls -la
```

## Tables

| Name    | Age | Role      |
| ------- | --- | --------- |
| Alice   | 30  | Developer |
| Bob     | 25  | Designer  |
| Charlie | 35  | Manager   |

## Horizontal Rules

---

---

---

## Callouts/Admonitions

> [!NOTE]
> This is a note callout

> [!TIP]
> This is a tip callout

> [!WARNING]
> This is a warning callout

> [!IMPORTANT]
> This is important information

> [!CAUTION]
> Be careful with this operation

> [!QUOTE]
> "This is a quote callout"
>
> - Someone Famous

> [!INFO]
> This is informational content

> [!SUCCESS]
> Operation completed successfully!

> [!QUESTION]
> What is the answer to this?

> [!FAILURE]
> Something went wrong

> [!DANGER]
> Critical warning - do not proceed

> [!BUG]
> Known bug in the system

> [!EXAMPLE]
> Here's an example of how to use this

> [!ABSTRACT]
> Summary or abstract content

> [!TODO]
> Task that needs to be completed

## LaTeX Math (if supported)

Inline math: $E = mc^2$

Block math:

$$
\int_0^\infty e^{-x^2} dx = \frac{\sqrt{\pi}}{2}
$$

## Emojis

:smile: :rocket: :heart: :fire:

## Footnotes

Here's a sentence with a footnote[^1].

[^1]: This is the footnote content.

## Definition Lists

Term 1
: Definition 1

Term 2
: Definition 2a
: Definition 2b
