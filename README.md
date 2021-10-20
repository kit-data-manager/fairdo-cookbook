# fairdo-cookbook

## Hierarchically numbered, ordered lists

This markdown code with custom html tag:

```
<nestednumerationlist>
1. first
    1. sub
        1. subsub
2. second
    1. sub
    2. sub
</nestednumerationlist>
```

will result in the nice HTMl version of this:

```
1. first
    1.1 sub
        1.1.1 subsub
2. second
    2.1 sub
    2.2 sub
```

instead of the default, which would have been

1. first
    1. sub
        1. subsub
2. second
    1. sub
    2. sub

without the tag. It is realized using a CSS trick in `hierarchical_numbered_lists.css`.

## Centering images

By default the images are left-aligned with the maximum width being the same as the text. To center the images, you may use the centerbox class:

```html
<div class="centerbox">
    <img src="./images/cover.png" alt="cookbook cover" style="height:50em;" />
</div>
```
