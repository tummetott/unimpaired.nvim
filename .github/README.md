# unimpaired.nvim

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

<details><summary>Click me</summary>

```lua
{
    default_keymaps = true,
    keymaps = {
        previous = {
            mapping = '[a',
            description = 'Jump to [count] previous file in arglist',
            dot_repeat = true
        },
        next = {
            mapping = ']a',
            description = 'Jump to [count] next file in arglist',
            dot_repeat = true,
        },
        first = {
            mapping = '[A',
            description = 'Jump to first file in arglist',
            dot_repeat = false,
        },
        last = {
            mapping = ']A',
            description = 'Jump to last file in arglist',
            dot_repeat = false,
        },
        bprevious = {
            mapping = '[b',
            description = 'Jump to [count] previous buffer',
            dot_repeat = true,
        },
        bnext = {
            mapping = ']b',
            description = 'Jump to [count] next buffer',
            dot_repeat = true,
        },
        bfirst = {
            mapping = '[B',
            description = 'Jump to first buffer',
            dot_repeat = false,
        },
        blast = {
            mapping = ']B',
            description = 'Jump to last buffer',
            dot_repeat = false,
        },
        lprevious = {
            mapping = '[l',
            description = 'Jump to [count] previous entry in loclist',
            dot_repeat = true,
        },
        lnext = {
            mapping = ']l',
            description = 'Jump to [count] next entry in loclist',
            dot_repeat = true,
        },
        lfirst = {
            mapping = '[L',
            description = 'Jump to first entry in loclist',
            dot_repeat = false,
        },
        llast = {
            mapping = ']L',
            description = 'Jump to last entry in loclist',
            dot_repeat = false,
        },
        lpfile = {
            mapping = '[<C-l>',
            description = 'Jump to last entry of [count] previous file in loclist',
            dot_repeat = true,
        },
        lnfile = {
            mapping = ']<C-l>',
            description = 'Jump to first entry of [count] next file in loclist',
            dot_repeat = true,
        },
        cprevious = {
            mapping = '[q',
            description = 'Jump to [count] previous entry in qflist',
            dot_repeat = true,
        },
        cnext = {
            mapping = ']q',
            description = 'Jump to [count] next entry in qflist',
            dot_repeat = true,
        },
        cfirst = {
            mapping = '[Q',
            description = 'Jump to first entry in qflist',
            dot_repeat = false,
        },
        clast = {
            mapping = ']Q',
            description = 'Jump to last entry in qflist',
            dot_repeat = false,
        },
        cpfile = {
            mapping = '[<C-q>',
            description = 'Jump to last entry of [count] previous file in qflist',
            dot_repeat = true,
        },
        cnfile = {
            mapping = ']<C-q>',
            description = 'Jump to first entry of [count] next file in qflist',
            dot_repeat = true,
        },
        tprevious = {
            mapping = '[t',
            description = 'Jump to [count] previous matching tag',
            dot_repeat = true,
        },
        tnext = {
            mapping = ']t',
            description = 'Jump to [count] next matching tag',
            dot_repeat = true,
        },
        tfirst = {
            mapping = '[T',
            description = 'Jump to first matching tag',
            dot_repeat = false,
        },
        tlast = {
            mapping = ']T',
            description = 'Jump to last matching tag',
            dot_repeat = false,
        },
        ptprevious = {
            mapping = '[<C-t>',
            description = ':tprevious in the preview window',
            dot_repeat = true,
        },
        ptnext = {
            mapping = ']<C-t>',
            description = ':tnext in the preview window',
            dot_repeat = true,
        },
        previous_file = {
            mapping = '[f',
            description = 'Previous file in directory. :colder in qflist',
            dot_repeat = true,
        },
        next_file = {
            mapping = ']f',
            description = 'Next file in directory. :cnewer in qflist',
            dot_repeat = true,
        },
        blank_above = {
            mapping = '[<Space>',
            description = 'Add [count] blank lines above',
            dot_repeat = true,
        },
        blank_below = {
            mapping = ']<Space>',
            description = 'Add [count] blank lines below',
            dot_repeat = true,
        },
        exchange_above = {
            mapping = '[e',
            description = 'Exchange line with [count] lines above',
            dot_repeat = true,
        },
        exchange_below = {
            mapping = ']e',
            description = 'Exchange line with [count] lines below',
            dot_repeat = true,
        },
        exchange_section_above = {
            mapping = '[e',
            description = 'Move section [count] lines up',
            dot_repeat = true,
        },
        exchange_section_below = {
            mapping = ']e',
            description = 'Move section [count] lines down',
            dot_repeat = true,
        },
        enable_cursorline = {
            mapping = '[oc',
            description = 'Enable cursorline',
            dot_repeat = false,
        },
        disable_cursorline = {
            mapping = ']oc',
            description = 'Disable cursorline',
            dot_repeat = false,
        },
        toggle_cursorline = {
            mapping = 'yoc',
            description = 'Toggle cursorline',
            dot_repeat = true,
        },
        enable_diff = {
            mapping = '[od',
            description = 'Enable diff',
            dot_repeat = false,
        },
        disable_diff = {
            mapping = ']od',
            description = 'Disable diff',
            dot_repeat = false,
        },
        toggle_diff = {
            mapping = 'yod',
            description = 'Toggle diff',
            dot_repeat = true,
        },
        enable_hlsearch = {
            mapping = '[oh',
            description = 'Enable hlsearch',
            dot_repeat = false,
        },
        disable_hlsearch = {
            mapping = ']oh',
            description = 'Disable hlsearch',
            dot_repeat = false,
        },
        toggle_hlsearch = {
            mapping = 'yoh',
            description = 'Toggle hlsearch',
            dot_repeat = true,
        },
        enable_ignorecase = {
            mapping = '[oi',
            description = 'Enable ignorecase',
            dot_repeat = false,
        },
        disable_ignorecase = {
            mapping = ']oi',
            description = 'Disable ignorecase',
            dot_repeat = false,
        },
        toggle_ignorecase = {
            mapping = 'yoi',
            description = 'Toggle ignorecase',
            dot_repeat = true,
        },
        enable_list = {
            mapping = '[ol',
            description = 'Show invisible characters (listchars)',
            dot_repeat = false,
        },
        disable_list = {
            mapping = ']ol',
            description = 'Hide invisible characters (listchars)',
            dot_repeat = false,
        },
        toggle_list = {
            mapping = 'yol',
            description = 'Toggle invisible characters (listchars)',
            dot_repeat = true,
        },
        enable_number = {
            mapping = '[on',
            description = 'Enable line numbers',
            dot_repeat = false,
        },
        disable_number = {
            mapping = ']on',
            description = 'Disable line numbers',
            dot_repeat = false,
        },
        toggle_number = {
            mapping = 'yon',
            description = 'Toggle line numbers',
            dot_repeat = true,
        },
        enable_relativenumber = {
            mapping = '[or',
            description = 'Enable relative numbers',
            dot_repeat = false,
        },
        disable_relativenumber = {
            mapping = ']or',
            description = 'Disable relative numbers',
            dot_repeat = false,
        },
        toggle_relativenumber = {
            mapping = 'yor',
            description = 'Toggle relative numbers',
            dot_repeat = true,
        },
        enable_spell = {
            mapping = '[os',
            description = 'Enable spell check',
            dot_repeat = false,
        },
        disable_spell = {
            mapping = ']os',
            description = 'Disable spell check',
            dot_repeat = false,
        },
        toggle_spell = {
            mapping = 'yos',
            description = 'Toggle spell check',
            dot_repeat = true,
        },
        enable_background = {
            mapping = '[ob',
            description = 'Set background to light',
            dot_repeat = false,
        },
        disable_background = {
            mapping = ']ob',
            description = 'Set background to dark',
            dot_repeat = false,
        },
        toggle_background = {
            mapping = 'yob',
            description = 'Toggle background',
            dot_repeat = true,
        },
        enable_colorcolumn = {
            mapping = '[ot',
            description = 'Enable colorcolumn',
            dot_repeat = false,
        },
        disable_colorcolumn = {
            mapping = ']ot',
            description = 'Disable colorcolumn',
            dot_repeat = false,
        },
        toggle_colorcolumn = {
            mapping = 'yot',
            description = 'Toggle colorcolumn',
            dot_repeat = true,
        },
        enable_cursorcolumn = {
            mapping = '[ou',
            description = 'Enable cursorcolumn',
            dot_repeat = false,
        },
        disable_cursorcolumn = {
            mapping = ']ou',
            description = 'Disable cursorcolumn',
            dot_repeat = false,
        },
        toggle_cursorcolumn = {
            mapping = 'you',
            description = 'Toggle cursorcolumn',
            dot_repeat = true,
        },
        enable_virtualedit = {
            mapping = '[ov',
            description = 'Enable virtualedit',
            dot_repeat = false,
        },
        disable_virtualedit = {
            mapping = ']ov',
            description = 'Disable virtualedit',
            dot_repeat = false,
        },
        toggle_virtualedit = {
            mapping = 'yov',
            description = 'Toggle virtualedit',
            dot_repeat = true,
        },
        enable_wrap = {
            mapping = '[ow',
            description = 'Enable line wrapping',
            dot_repeat = false,
        },
        disable_wrap = {
            mapping = ']ow',
            description = 'Disable line wrapping',
            dot_repeat = false,
        },
        toggle_wrap = {
            mapping = 'yow',
            description = 'Toggle line wrapping',
            dot_repeat = true,
        },
        enable_cursorcross = {
            mapping = '[ox',
            description = 'Enable cursorcross',
            dot_repeat = false,
        },
        disable_cursorcross = {
            mapping = ']ox',
            description = 'Disable cursorcross',
            dot_repeat = false,
        },
        toggle_cursorcross = {
            mapping = 'yox',
            description = 'Toggle cursorcross',
            dot_repeat = true,
        },
    }
}
```

</details>

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
