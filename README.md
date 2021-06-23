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