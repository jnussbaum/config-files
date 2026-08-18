# Markdown Preferences

When writing markdown, follow the principles of Semantic Line Breaks:

- A semantic line break MUST NOT alter the final rendered output of the document.
- A semantic line break SHOULD NOT alter the intended meaning of the text.
- A semantic line break MUST occur after a sentence, as punctuated by a period (.), exclamation mark (!), or question mark (?).
- A semantic line break SHOULD occur after an independent clause as punctuated by a comma (,), semicolon (;), colon (:), or em dash (—).
- A semantic line break MAY occur after a dependent clause in order to clarify grammatical structure or satisfy line length constraints.
- A semantic line break is RECOMMENDED before an enumerated or itemized list.
- A semantic line break MAY be used after one or more items in a list in order to logically group related items or satisfy line length constraints.
- A semantic line break MUST NOT occur within a hyphenated word.
- A semantic line break MAY occur before and after a hyperlink.
- A semantic line break MAY occur before inline markup.
- A maximum line length of 100 characters is RECOMMENDED.
- A line MAY exceed the maximum line length if necessary, such as to accommodate hyperlinks, code elements, or other markup.

## Tables

- Markdown tables MUST use aligned column formatting where all cells in a column have equal width in the source.
- Use padding spaces to align column separators (`|`) vertically.
- This ensures the markdown source is readable and maintainable in plain text editors.
