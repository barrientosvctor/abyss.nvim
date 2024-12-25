# 👥 Contributing

If you're reading this file. Surely you want to contribute to the development of
this colorscheme, so thank you so much for considering it!

Any issue or pull request is welcome. In this section, I will guide you to make
your first contribution.

- Before these instructions, it's recommended to before create an issue about
your change to talk about it.

- All branches must be based from `develop` branch. So, make sure to include
the `develop` branch when forking this repository. Then, you need to
create a new branch based on this one.

```shell
$ git switch develop
$ git checkout -b branch-name
```

- Make sure to pull the latest commits from `develop` branch to your branch
before making a commit.

- All pull requests must go from your branch to `develop` branch.

## Making a new abyss variant

Make sure to follow these rulements if you want to contribute creating a new
variant (palette) for abyss.

Note: All files related to their new variant, must be named as the variant's
name.

- Create a new file on `colors/*.vim`.
- Create a new file for Lualine, Vim-airline/Lightline themes of their variant.
- Create a new file on `lua/abyss/palettes/*.lua` (The name of the palette will
be used for naming the colorscheme in use `vim.g.colors_name`).
- Add and test your new variant against the test cases for variants in its file:
`test/abyss/palette_spec.lua`

## Merging the pull request

Your pull request should pass all code reviews (if there is) to
merge it to `develop` . These code reviews are GitHub workflows.

Also make sure you don't include any `CHANGELOG.md` in your pull request so you
don't have conflicts with the original file in the `main` branch.

## How should you write your commits?

Refer to [release-please-action](https://github.com/googleapis/release-please-action?tab=readme-ov-file#how-should-i-write-my-commits) section.

## Syntax highlight groups

If you want to contribute about wrong syntax highlighting on colorscheme. This
section will help you to determine what highlight group is being applied to a
specific piece of syntax. It'll output the highlight group for the value under
the cursor.

### Treesitter highlighting

Neovim has included a command with these characteristics. Just type: `:Inspect`.

### Vim highlighting

Add this function to your vimrc:

```vim
function! SynStack()
  for i1 in synstack(line("."), col("."))
    let i2 = synIDtrans(i1)
    let n1 = synIDattr(i1, "name")
    let n2 = synIDattr(i2, "name")
    echo n1 "->" n2
  endfor
endfunction

map <F2> <cmd>call SynStack()<cr>
```
