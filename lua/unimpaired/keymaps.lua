local M = {}
local conf = require 'unimpaired.config'
local functions = require 'unimpaired.functions'
local call_path = "v:lua.require'unimpaired.functions'."

M.register = function()
    local keymaps = conf.options.keymaps
    if not keymaps then return end
    for target, value in pairs(keymaps) do
        if value then
            local mode = 'n'
            if vim.startswith(target, 'exchange_section_') then
                mode = 'x'
            elseif vim.endswith(target, '_motion') then
                mode = 'o'
            end
            local map = value.mapping or value
            local callback
            local opt = {}
            opt.desc = value.description
            opt.expr = mode ~= 'o' and value.dot_repeat or false
            if functions[target] then
                -- in o-mode dot-repeatable is set by the operator
                -- e.g. in `d]n`, the `d` operation determines dot-repeatable
                if value.dot_repeat and mode ~= 'o' then
                    callback = function()
                        vim.go.operatorfunc = call_path .. target
                        return 'g@l'
                    end
                else
                    callback = function() functions[target]() end
                end
                vim.keymap.set(mode, map, callback, opt)
            else
                print('Unimpaired.nvim: "' .. target .. '" is not a valid keymap')
                return
            end
        end
    end
end

return M
