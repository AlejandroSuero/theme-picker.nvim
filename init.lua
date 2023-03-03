--[[
local ok, themepicker = pcall(require, 'themepicker')
if (not ok) then
  vim.notify('Theme picker not loaded', 3)
  return
end
]]
local themepicker = require('themepicker')

local M = {}

M._create_picker = themepicker._pickers.new(themepicker.win_opts, themepicker.opts)

vim.keymap.set('n', '<leader>p', function() M._create_picker:find() end)
