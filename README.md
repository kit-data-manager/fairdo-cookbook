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

## Applied Theme customizations

Please try to make the customizations somehow findable, e.g. by leaving a comment with the keyword "KIT customization" or so, so one can search for "KIT" and find it.

### Header

To make the logo in the header work:

- `index.hbs`: default is https://github.com/rust-lang/mdBook/blob/master/src/theme/index.hbs
  - The index file in this repository is a copy with the following modifications.
  - Switched those lines ([see issue](https://github.com/rust-lang/mdBook/issues/1331#issuecomment-903108413)):
    ```html
    <div id="menu-bar-hover-placeholder" class="click-transparent"></div>
    {{> header}}
    ```
    This makes the trick with the `header.hbs` file work.
  - Added the logos for desktop view to the "right-buttons" div:
    ```html
    <div class="right-buttons">
        <div class="logo-spacing-general">
            <a class="mobile-off logo-align-middle logo-card" href="https://kit.edu/" title="Karlsruhe Institute of Technology" aria-label="Visit the KIT Website">
                <img class="lightonly" src="{{ path_to_root }}kit_logo_en_black.svg" alt="KIT logo">
                <img class="darkonly" src="{{ path_to_root }}kit_logo_en_white.svg" alt="KIT logo">
                <img class="whiteonly" src="{{ path_to_root }}kit_logo_en.svg" alt="KIT logo">
            </a>
        </div>
  - Added a script to define on which theme which logo is being shown:
    ```html
    <script>
            // KIT-specific change: This script does not exist in the original index.hbs. !-->
            // see https://raw.githubusercontent.com/rust-lang/mdBook/master/src/theme/index.hbs
            function updateThemeElements() {
                ...
    ```
- `header.hbs`: default is empty file (see https://github.com/rust-lang/mdBook/blob/master/src/theme/header.hbs)
  - Contains the KIT Logos for mobile devices
  - This file could also be the place for e.g. temporary event notices or so.
- `theme-adjustments.css`
  - For general formatting of the logos
  - Define when logos will be hidden (e.g. mobile view)