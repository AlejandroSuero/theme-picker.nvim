--[[
local themes = M._pickers.new(M.win_opts, M.opts)

themes:find()
]]
local configs = require('themepicker.configs')

local M = {}
local themes = configs._themes

M.open_menu = function()
  themes:find()
end
return M
