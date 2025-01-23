# unimpaired.nvim

[![LuaRocks][luarocks-shield]][luarocks-url]

### :pencil: Description:

This is a LUA port of tpopes famous [vim-unimpaired](https://github.com/tpope/vim-unimpaired) plugin. `unimpaired.nvim` aims to replicate the exact behaviour of `vim-unimpaired`, with some exceptions (see [caveats](#caveats)).

`unimpaired.nvim` is a collection of useful keymaps which follow a pattern: They
come in complementary pairs which mostly fall into four categories:

- There are mappings which are simply short normal mode aliases for commonly used ex commands. `]q` is `:cnext`. `[q` is `:cprevious`. `]a` is `:next`. `[b` is `:bprevious`. See the [default configuration](#default-configuration) for the full set of 20 mappings
- There are linewise mappings. `[<Space>` and `]<Space>` add newlines before and after the cursor line. `[e` and `]e` exchange the current line with the one above or below it.
- There are mappings for toggling options. `[os`, `]os`, and `yos` perform `:set spell`, `:set nospell`, and `:set invspell`, respectively. There's also `l` (list), `n` (number), `w` (wrap), `x` (cursorline cursorcolumn), and several others
- And in the miscellaneous category, there's `[f` and `]f` to go to the next/previous file in the directory, and `[n` and `]n` to jump between SCM conflict markers (the latter is not implemented yet)

### ✨ Features

- 🔥 Keymaps can be changed
- ❌ You can disable keymaps you don't need
- 🔁 All mappings are dot repeatable without additional plugin
- 📝 Mappings have proper keymap descriptions (used by e.g. [which-key](https://github.com/folke/which-key.nvim))
- 🔢 Many mappings can be prefixed with [count]
- 👯 Default behaviour mimics the original [vim-unimpaired](https://github.com/tpope/vim-unimpaired) plugin
- 💨 Written in LUA instead of vim script


### ⚡️ Requirements

- Neovim >= 0.5.0


### 📦 Installation

Install the plugin with your favourite package manager.

Example using [lazy](https://github.com/folke/lazy.nvim):

```lua
{
    'tummetott/unimpaired.nvim',
    event = 'VeryLazy',
    opts = {
        -- add options here if you wish to override the default settings
    },
}
```


### ⚙️  Configuration

The `setup()` function takes a dictionary with user configurations. If you don't
want to customize the default behaviour, you don't need to put anything in
there. The default behaviour mimics the functionality off `vim-unimpaired`.

Customizing keymaps works as following:

```lua
require('unimpaired').setup {
    keymaps = {
        -- To overwrite the mapping, keymap description and dot-repetition for
        -- ':bnext', write
        bnext = {
            mapping = '<leader>n',
            description = 'Go to [count] next buffer',
            dot_repeat = true,
        },

        -- To disable dot repetition for ':bprevious', write
        bprevious = {
            mapping = '<leader>p',
            description = 'Go to [count] previous buffer',
            dot_repeat = false,
        },

        -- If you just want to change the keymap for ':bfirst' and don't care
        -- about desciption and dot-repetition, write the shorthand
        bfirst = '<leader>N',

        -- To disable the kemap ':blast' completely, set it to false
        blast = false,
    }

    -- Disable the default mappings if you prefer to define your own mappings
    default_keymaps = false,
}
```

##### Default Configuration
To see all keys of the `keymaps` table, have a look at the default setup options of `unimpaired.nvim`:

[Default Configuration](https://github.com/tummetott/unimpaired.nvim/blob/8e504ba95dd10a687f4e4dacd5e19db221b88534/lua/unimpaired/config.lua)

### Caveats:

This plugin is work in progress. You may experience bugs and changes of the API.

Functionalities which are not supported yet:

- Go to the previous SCM conflict marker or diff/patch hunk
- Go to the next SCM conflict marker or diff/patch hunk
- Paste after linewise, increasing indent
- Paste before linewise, increasing indent
- Paste after linewise, decreasing indent
- Paste before linewise, decreasing indent
- Paste after linewise, reindenting
- Paste before linewise, reindenting
- XML encode
- XML decode
- URL encode
- URL decode
- C String encode
- C String decode

### ✅ Todos:

- Write helpfile
- Implement missing functionalities

PRs are welcome!
x Tummetott

<!-- MARKDOWN LINKS & IMAGES -->
[neovim-shield]: https://img.shields.io/badge/NeoVim-%2357A143.svg?&style=for-the-badge&logo=neovim&logoColor=white
[neovim-url]: https://neovim.io/
[lua-shield]: https://img.shields.io/badge/lua-%232C2D72.svg?style=for-the-badge&logo=lua&logoColor=white
[lua-url]: https://www.lua.org/
[luarocks-shield]: https://img.shields.io/luarocks/v/tummetott/unimpaired.nvim?logo=lua&color=purple
[luarocks-url]: https://luarocks.org/modules/tummetott/unimpaired.nvim
