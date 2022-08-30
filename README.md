# vim-operator-partedit

Operator to open part of buffer into other buffer.

## Introduction

**operator-partedit** is a Vim plugin that provide some operator which use 
partedit.

## Keymappings

- `<Plug>(operator-partedit-start)`

Open part of buffer into other buffer.
The new buffer has no filetype.

- `<Plug>(operator-partedit-codeblock)`

Open part of buffer into other buffer.
If first line of motion is like markdown's codeblock, open buffer as its filetype.
If run operator to below, open buffer as `typescript`

```
    ```typescript
    console.log("foo")
    ```
```

## License

[MIT License](./LICENSE)
