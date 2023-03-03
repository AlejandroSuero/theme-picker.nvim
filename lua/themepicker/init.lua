--[[
local themes = M._pickers.new(M.win_opts, M.opts)

themes:find()
]]
local configs = require('themepicker.configs')

local M = {}
local _is_open = false
local _picker_opts = configs._pickers.new(configs.win_opts, configs.opts)

M.toggle_menu = function()
  if (_is_open) then
    configs._actions.close(0)
    _is_open = false
  end
  _is_open = true
  _picker_opts:find()
end
return M
