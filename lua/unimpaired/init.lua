local M = {}
local config = require('unimpaired.config')
local keymaps = require('unimpaired.keymaps')

M.setup = function(user_config)
    config.init(user_config)
    keymaps.register()
end

return M
