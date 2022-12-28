local M = {}
local config = require('unimpaired.config')
local keymaps = require('unimpaired.keymaps')

M.setup = function(user_config)
    config.setup(user_config)
    keymaps.register()
end

return M
