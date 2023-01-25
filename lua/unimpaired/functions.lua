local M = {}

-- Dot repetition of a custom mapping breaks as soon as there is a dot repeatable normal
-- mode command inside the mapping. This function restores the dot repetition of
-- the mapping while preserving the [count] when called as last statement inside
-- the custom mapping
local restore_dot_repetition = function(count)
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

M.lpfile = function()
    vim.cmd('silent! ' .. vim.v.count1 .. 'lpfile')
end

M.lnfile = function()
    vim.cmd('silent! ' .. vim.v.count1 .. 'lnfile')
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

M.cpfile = function()
    vim.cmd('silent! ' .. vim.v.count1 .. 'cpfile')
end

M.cnfile = function()
    vim.cmd('silent! ' .. vim.v.count1 .. 'cnfile')
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

M.ptprevious = function()
    vim.cmd('silent! ' .. vim.v.count1 .. 'ptprevious')
end

M.ptnext = function()
    vim.cmd('silent! ' .. vim.v.count1 .. 'ptnext')
end

local get_current_wininfo = function()
    return vim.fn.getwininfo(vim.fn.win_getid())[1]
end

local get_files = function(dir)
    local entries = vim.fn.split(vim.fn.glob(dir .. '/*'), '\n')
    local files = {}
    for _, entry in pairs(entries) do
        if vim.fn.isdirectory(entry) ~= 1 then
            table.insert(files, vim.fn.fnamemodify(entry, ':t'))
        end
    end
    if vim.tbl_isempty(files) then return else return files end
end

local file_by_offset = function(offset)
    local dir = vim.fn.expand('%:p:h')
    local files = get_files(dir)
    if not files then return end
    local current = vim.fn.expand('%:t')
    if current == '' then
        if offset < 0 then return dir .. '/' .. files[1]
        else return dir .. '/' .. files[#files] end
    else
        local index = vim.fn.index(files, current) + 1
        if index == 0 then return end
        index = index + offset
        if index < 1 then index = 1
        elseif index > #files then index = #files end
        return dir .. '/' .. files[index]
    end
end

M.previous_file = function()
    local wininfo = get_current_wininfo()
    if wininfo.loclist == 1 then
        vim.cmd('silent! lolder ' .. vim.v.count1)
    elseif wininfo.quickfix == 1 then
        vim.cmd('silent! colder ' .. vim.v.count1)
    else
        local file = file_by_offset(-vim.v.count1)
        if file then
            vim.cmd('edit ' .. file)
        end
    end
end

M.next_file = function()
    local wininfo = get_current_wininfo()
    if wininfo.loclist == 1 then
        vim.cmd('silent! lnewer ' .. vim.v.count1)
    elseif wininfo.quickfix == 1 then
        vim.cmd('silent! cnewer ' .. vim.v.count1 )
    else
        local file = file_by_offset(vim.v.count1)
        if file then
            vim.cmd('edit ' .. file)
        end
    end
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
    restore_dot_repetition(count)
end

M.exchange_below = function()
    local count = vim.v.count1
    vim.cmd('silent! move +' .. count)
    vim.cmd.normal('==')
    restore_dot_repetition(count)
end

M.exchange_section_above = function()
    local count = vim.v.count1
    vim.cmd("silent! '<,'>move '<--" .. count)
    vim.cmd.normal('gv=')
    restore_dot_repetition(count)
end

M.exchange_section_below = function()
    local count = vim.v.count1
    vim.cmd("silent! '<,'>move '>+" .. count)
    vim.cmd.normal('gv=')
    restore_dot_repetition(count)
end

M.enable_background = function()
    vim.o.background = 'light'
end

M.disable_background = function()
    vim.o.background = 'dark'
end

M.toggle_background = function()
    if vim.o.background == 'dark' then M.enable_background()
    else M.disable_background() end
end

M.enable_cursorline = function() vim.o.cursorline = true end

M.disable_cursorline = function() vim.o.cursorline = false end

M.toggle_cursorline = function()
    -- The plugin reticle.nvim has an option to always show the cursorline
    -- number, even when the cursorline itself is not enabled. This requires the
    -- cursorline setting to remain switched on. Therefore we can't get the
    -- cursorline state from the option itself, we load it from the plugin
    local loaded, reticle = pcall(require, 'reticle')
    if loaded then vim.o.cursorline = not reticle.enabled.cursorline
    else vim.o.cursorline = not vim.o.cursorline end
end

M.enable_diff = function() vim.cmd('diffthis') end

M.disable_diff = function() vim.cmd('diffoff') end

M.toggle_diff = function()
    if vim.o.diff then M.disable_diff()
    else M.enable_diff() end
end

M.enable_hlsearch = function() vim.o.hlsearch = true end

M.disable_hlsearch = function() vim.o.hlsearch = false end

M.toggle_hlsearch = function() vim.o.hlsearch = not vim.o.hlsearch end

M.enable_ignorecase = function() vim.o.ignorecase = true end

M.disable_ignorecase = function() vim.o.ignorecase = false end

M.toggle_ignorecase = function() vim.o.ignorecase = not vim.o.ignorecase end

M.enable_list = function() vim.o.list = true end

M.disable_list = function() vim.o.list = false end

M.toggle_list = function() vim.o.list = not vim.o.list end

M.enable_number = function() vim.o.number = true end

M.disable_number = function() vim.o.number = false end

M.toggle_number = function() vim.o.number = not vim.o.number end

M.enable_relativenumber = function() vim.o.relativenumber = true end

M.disable_relativenumber = function() vim.o.relativenumber = false end

M.toggle_relativenumber = function() vim.o.relativenumber = not vim.o.relativenumber end

M.enable_spell = function() vim.o.spell = true end

M.disable_spell = function() vim.o.spell = false end

M.toggle_spell = function() vim.o.spell = not vim.o.spell end

M.enable_colorcolumn = function() vim.o.colorcolumn = '+1' end

M.disable_colorcolumn = function() vim.o.colorcolumn = '' end

M.toggle_colorcolumn = function()
    if vim.o.colorcolumn == '' then M.enable_colorcolumn()
    else M.disable_colorcolumn() end
end

M.enable_cursorcolumn = function() vim.o.cursorcolumn = true end

M.disable_cursorcolumn = function() vim.o.cursorcolumn = false end

M.toggle_cursorcolumn = function() vim.o.cursorcolumn = not vim.o.cursorcolumn end

M.enable_virtualedit = function() vim.o.virtualedit = 'all' end

M.disable_virtualedit = function() vim.o.virtualedit = '' end

M.toggle_virtualedit = function()
    if vim.o.virtualedit == '' then M.enable_virtualedit()
    else M.disable_virtualedit() end
end

M.enable_wrap = function() vim.o.wrap = true end

M.disable_wrap = function() vim.o.wrap = false end

M.toggle_wrap = function() vim.o.wrap = not vim.o.wrap end

M.enable_cursorcross = function()
    vim.o.cursorline = true
    vim.o.cursorcolumn = true
end

M.disable_cursorcross = function()
    vim.o.cursorline = false
    vim.o.cursorcolumn = false
end

M.toggle_cursorcross = function()
    if vim.o.cursorcolumn then M.disable_cursorcross()
    else M.enable_cursorcross() end
end

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local state = {
    paste = nil,
    mouse = nil,
}

local setup_paste = function()
    state.paste = vim.o.paste
    state.mouse = vim.o.mouse
    vim.o.paste = true
    vim.o.mouse = ''
    local group = augroup('unimpaired_restore_paste', { clear = true })
    autocmd('InsertLeave', {
        callback = function()
            vim.o.paste = state.paste
            vim.o.mouse = state.mouse
            vim.cmd('autocmd! unimpaired_restore_paste')
        end,
        group = group
    })
end

M.paste_above = function()
    setup_paste()
    return 'O'
end

M.paste_below = function()
    setup_paste()
    return 'o'
end


return M
