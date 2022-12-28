local M = {}

-- Custom keymaps can be dot repeated, when they are executed through the
-- operatorfunc. Whenever there is a normal mode command inside the custom
-- keymap, the dot would repeat the last normal mode command and not the whole
-- custom keymap. This function sets the operatorfunc as last executed command
-- (without executing the callback) and therefore preserves the dot repetition of
-- the whole keymap
local preserveDotRepeat = function(count)
    count = count or ''
    local callback = vim.go.operatorfunc
    vim.go.operatorfunc = ''
    vim.cmd('silent! normal ' .. count .. 'g@l')
    vim.go.operatorfunc = callback
end

M.previous = function()
    vim.cmd('silent! ' .. vim.v.count1 .. 'previous')
end

M.next = function()
    vim.cmd('silent! ' .. vim.v.count1 .. 'next')
end

M.first = function()
    vim.cmd('first')
end

M.last = function()
    vim.cmd('last')
end

M.bprevious = function()
    vim.cmd(vim.v.count1 .. 'bprevious')
end

M.bnext = function()
    vim.cmd(vim.v.count1 .. 'bnext')
end

M.bfirst = function()
    vim.cmd('bfirst')
end

M.blast = function()
    vim.cmd('blast')
end

M.lprevious = function()
    vim.cmd('silent! ' .. vim.v.count1 .. 'lprevious')
    vim.cmd.normal('zv')
end

M.lnext = function()
    vim.cmd('silent! ' .. vim.v.count1 .. 'lnext')
    vim.cmd.normal('zv')
end

M.lfirst = function()
    vim.cmd('lfirst')
end

M.llast = function()
    vim.cmd('llast')
end

M.cprevious = function()
    vim.cmd('silent! ' .. vim.v.count1 .. 'cprevious')
    vim.cmd.normal('zv')
end

M.cnext = function()
    vim.cmd('silent! ' .. vim.v.count1 .. 'cnext')
    vim.cmd.normal('zv')
end

M.cfirst = function()
    vim.cmd('cfirst')
end

M.clast = function()
    vim.cmd('clast')
end

M.tprevious = function()
    vim.cmd('silent! ' .. vim.v.count1 .. 'tprevious')
end

M.tnext = function()
    vim.cmd('silent! ' .. vim.v.count1 .. 'tnext')
end

M.tfirst = function()
    vim.cmd('tfirst')
end

M.tlast = function()
    vim.cmd('tlast')
end

M.blank_above = function()
    vim.cmd("put! =repeat(nr2char(10), v:count1)|silent ']+")
end

M.blank_below = function()
    vim.cmd("put =repeat(nr2char(10), v:count1)|silent '[-")
end

M.exchange_above = function()
    local count = vim.v.count1
    vim.cmd('silent! move --' .. count)
    vim.cmd.normal('==')
    preserveDotRepeat(count)
end

M.exchange_below = function()
    local count = vim.v.count1
    vim.cmd('silent! move +' .. count)
    vim.cmd.normal('==')
    preserveDotRepeat(count)
end

M.exchange_section_above = function()
    local count = vim.v.count1
    vim.cmd("silent! '<,'>move '<--" .. count)
    vim.cmd.normal('gv=')
    preserveDotRepeat(count)
end

M.exchange_section_below = function()
    local count = vim.v.count1
    vim.cmd("silent! '<,'>move '>+" .. count)
    vim.cmd.normal('gv=')
    preserveDotRepeat(count)
end

M.enable_background = function()
    vim.o.background = 'light'
end

M.disable_background = function()
    vim.o.background = 'dark'
end

M.toggle_background = function()
    if vim.o.background == 'dark' then
        M.enable_background()
    else
        M.disable_background()
    end
end

M.enable_cursorline = function() vim.o.cursorline = true end

M.disable_cursorline = function() vim.o.cursorline = false end

M.toggle_cursorline = function()
    if vim.o.cursorline then
        M.disable_cursorline()
    else
        M.enable_cursorline()
    end
end

M.enable_diff = function()
    vim.cmd('diffthis')
end

M.disable_diff = function()
    vim.cmd('diffoff')
end

M.toggle_diff = function()
    if vim.o.diff then
        M.disable_diff()
    else
        M.enable_diff()
    end
end

M.enable_hlsearch = function() vim.o.hlsearch = true end

M.disable_hlsearch = function() vim.o.hlsearch = false end

M.toggle_hlsearch = function()
    if vim.o.hlsearch then
        M.disable_hlsearch()
    else
        M.enable_hlsearch()
    end
end

M.enable_ignorecase = function() vim.o.ignorecase = true end

M.disable_ignorecase = function() vim.o.ignorecase = false end

M.toggle_ignorecase = function()
    if vim.o.ignorecase then
        M.disable_ignorecase()
    else
        M.enable_ignorecase()
    end
end

M.enable_list = function() vim.o.list = true end

M.disable_list = function() vim.o.list = false end

M.toggle_list = function()
    if vim.o.list then
        M.disable_list()
    else
        M.enable_list()
    end
end

M.enable_number = function() vim.o.number = true end

M.disable_number = function() vim.o.number = false end

M.toggle_number = function()
    if vim.o.number then
        M.disable_number()
    else
        M.enable_number()
    end
end

M.enable_relativenumber = function() vim.o.relativenumber = true end

M.disable_relativenumber = function() vim.o.relativenumber = false end

M.toggle_relativenumber = function()
    if vim.o.relativenumber then
        M.disable_relativenumber()
    else
        M.enable_relativenumber()
    end
end

M.enable_spell = function() vim.o.spell = true end

M.disable_spell = function() vim.o.spell = false end

M.toggle_spell = function()
    if vim.o.spell then
        M.disable_spell()
    else
        M.enable_spell()
    end
end

M.enable_colorcolumn = function()
    vim.o.colorcolumn = '+1'
end

M.disable_colorcolumn = function()
    vim.o.colorcolumn = ''
end

M.toggle_colorcolumn = function()
    if vim.o.colorcolumn == '' then
        M.enable_colorcolumn()
    else
        M.disable_colorcolumn()
    end
end

M.enable_cursorcolumn = function() vim.o.cursorcolumn = true end

M.disable_cursorcolumn = function() vim.o.cursorcolumn = false end

M.toggle_cursorcolumn = function()
    if vim.o.cursorcolumn then
        M.disable_cursorcolumn()
    else
        M.enable_cursorcolumn()
    end
end

M.enable_virtualedit = function()
    vim.o.virtualedit = 'all'
end

M.disable_virtualedit = function()
    vim.o.virtualedit = ''
end

M.toggle_virtualedit = function()
    if vim.o.virtualedit == '' then
        M.enable_virtualedit()
    else
        M.disable_virtualedit()
    end
end

M.enable_wrap = function() vim.o.wrap = true end

M.disable_wrap = function() vim.o.wrap = false end

M.toggle_wrap = function()
    if vim.o.wrap then
        M.disable_wrap()
    else
        M.enable_wrap()
    end
end

M.enable_cursorcross = function()
    vim.o.cursorline = true
    vim.o.cursorcolumn = true
end

M.disable_cursorcross = function()
    vim.o.cursorline = false
    vim.o.cursorcolumn = false
end

M.toggle_cursorcross = function()
    if vim.o.cursorcolumn then
        M.disable_cursorcross()
    else
        M.enable_cursorcross()
    end
end

return M
