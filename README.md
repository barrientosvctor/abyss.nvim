# abyss.nvim
(Neo)vim colorscheme inspired by Abyss theme in Visual Studio Code.

https://github.com/barrientosvctor/abyss.nvim/assets/113469901/7d20f6f0-c438-4ac1-9838-7c1d49f412b9

## ⚡️ Requeriments
* [Neovim](https://github.com/neovim/neovim) >= **0.8.0** or [Vim 9](https://www.vim.org/) with lua >= **5.1**.

## 📦 Installation

You can use any package manager you like.

**I highly recommend updating abyss.nvim when a release/tag comes out, since it is possible that there are development commits before that that can cause unexpected errors when using the colorscheme. To do this, make sure to specify a tag in your preferred package manager (if it supports it) before downloading the colorscheme.**

<table>
<tr>
<td> <b>Package manager</b> </td> <td> <b>Installation</b> </td>
</tr>

<!-- Packer.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/wbthomason/packer.nvim">packer.nvim</a> </td>
<td>

```lua
use {
    'barrientosvctor/abyss.nvim',
    run = function()
        local status, abyss = pcall(require, 'abyss')
        if not status then return end

        abyss.setup()
    end
}
```

</td>
</tr>

<!-- Lazy.nvim -->
</tr>
<tr>
<td> <a href="https://github.com/folke/lazy.nvim">lazy.nvim</a> </td>
<td>

```lua
{
    'barrientosvctor/abyss.nvim',
    lazy = false,
    priority = 1000,
    opts = {}
}
```

</td>
</tr>

<!-- Vim-plug -->
</tr>
<tr>
<td> <a href="https://github.com/junegunn/vim-plug">Vim-plug</a> </td>
<td>

```vim
Plug 'barrientosvctor/abyss.nvim'
```

</td>
</tr>

<!-- Vundle.vim -->
</tr>
<tr>
<td> <a href="https://github.com/VundleVim/Vundle.vim">Vundle.vim</a> </td>
<td>

```vim
Plugin 'barrientosvctor/abyss.nvim'
```

</td>
</tr>

<!-- Vim pack -->
</tr>
<tr>
<td> Vim's built-in package manager </td>
<td>

```shell
mkdir -p ~/.vim/pack/colors/start
cd ~/.vim/pack/colors/start
git clone https://github.com/barrientosvctor/abyss.nvim.git
```

</td>
</tr>
</table>

## 💻 Setup

Abyss.nvim has options to customize your colorscheme instance according to your preferences.

These are the available options for the colorscheme:

```lua
require('abyss').setup({
    italic_comments = true, -- Toggle italic comments
    italic = false, -- Toggle italic for function names, keywords, strings and booleans
    bold = false, -- Toggle bold for function names, keywords and booleans
    transparent_background = false, -- Toggle transparency on neovim background
    treesitter = true -- Enable treesitter highlighting. No need to configuration. Default value: (Neovim = true), (Vim = false)
    overrides = {} -- Override the default colorscheme highlight to a any else. Default value: nil
})
```

### Vim Script with Lua

```vim
lua << EOF
require("abyss").setup {
    " your setup options
}
EOF
```

### Overwriting highlights

You can be able to use all of [nvim_set_hl()](https://neovim.io/doc/user/api.html#nvim_set_hl())
function properties to override the colorscheme colors.

```lua
local c = require('abyss.colors')

require('abyss').setup({
    overrides = {
        String = { fg = c.heavyyellow, bold = true },
        -- or:
        ['String'] = { fg = "#ffeebb", bold = true },
        -- ...rest of highlight overrides
    }
})
```

## 🔌 Plugins supported
* [TreeSitter](https://github.com/nvim-treesitter/nvim-treesitter)
* [Bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
* [LSP Diagnostics](https://neovim.io/doc/user/lsp.html)
* [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
* [LspSaga](https://github.com/glepnir/lspsaga.nvim)
* [Git Signs](https://github.com/lewis6991/gitsigns.nvim)
* [Git Gutter](https://github.com/airblade/vim-gitgutter)
* [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
* [NERDTree](https://github.com/preservim/nerdtree)
* [Neotree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim)
* [Indent-Blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
* [nvim-notify](https://github.com/rcarriga/nvim-notify)
* [Dashboard](https://github.com/glepnir/dashboard-nvim)
* [Which-key](https://github.com/folke/which-key.nvim)

## 🚀 Usage

> Vim Script

```vim
colorscheme abyss
```

> Lua

```lua
vim.cmd.colorscheme 'abyss'
```

Abyss.nvim also includes a [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) theme, you can use it setting up into lualine setup options:

```lua
require('lualine').setup {
    options = {
        theme = 'abyss'
    }
}
```

## 📝 Notes

- If you have Bufferline.nvim installed in your dotfiles, bufferline should be loaded after setting up abyss.nvim or it will highlight incorrectly. I'll provide you examples about this using [Packer.nvim](https://github.com/wbthomason/packer.nvim) and [Lazy.nvim](https://github.com/folke/lazy.nvim)

<details>
<summary>Click to see Lazy.nvim example</summary>

- Abyss.nvim config

```lua
{
    'barrientosvctor/abyss.nvim',
    lazy = false,
    priority = 1000,
    opts = {}
}
```

- Bufferline config

```lua
{
    'akinsho/bufferline.nvim',
    lazy = true,
    event = "UIEnter",
    -- ...rest of your config
}
```

</details>

<details>
<summary>Click to see Packer.nvim example</summary>

- Bufferline config

```lua
use {
    'akinsho/bufferline.nvim',
    after = 'abyss.nvim',
    -- ...rest of your config
}
```

</details>

## 👥 Contributing

Any issue or pull request is welcome. In this section, I will guide you to make
your first contribution.

- Before these instructions, it's recommended to before create an issue about
your change to talk about it.

- All branches must be based from `develop` branch. So, you need to
create a new branch based on this one.

```shell
$ git switch develop
$ git checkout -b branch-name
```

- Make sure to pull the latest commits from `develop` branch to your branch
before make a commit.

- All pull requests must go from your branch to `develop` branch.

### How should you write your commits?

Refer to [release-please-action](https://github.com/googleapis/release-please-action?tab=readme-ov-file#how-should-i-write-my-commits) section.

### Syntax highlight groups

If you want to contribute about wrong syntax highlighting on colorscheme. This
section will help you to determine what highlight group is being applied to a
specific piece of syntax. It'll output the highlight group for the value under
the cursor.

#### Treesitter highlighting

Neovim has included a command with these characteristics. Just type: `:Inspect`.

#### Vim highlighting

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

## 🤗 Acknowledgements

- [nightfox](https://github.com/EdenEast/nightfox.nvim) -> codebase for vim support
