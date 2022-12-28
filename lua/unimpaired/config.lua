local M = {}

local defaults = {
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

M.setup = function(user_conf)
    user_conf = user_conf or {}
    if user_conf.default_keymaps == false then
        defaults = {}
    end
    M.options = vim.tbl_deep_extend('force', defaults, user_conf)
end

return M
