local ok_pickers, pickers = pcall(require, 'telescope.pickers')
if (not ok_pickers) then
  vim.notify('Telescope is required for this plugin to work.\nGo to https://github.com/nvim-telescope/telescope.nvim', 3)
  return
end
local finders       = require('telescope.finders')
local sorters       = require('telescope.sorters')
local actions       = require('telescope.actions')
local actions_state = require('telescope.actions.state')

local M             = {
  _finders = finders,
  _pickers = pickers,
  _sorters = sorters,
  _actions = actions,
  _actions_state = actions_state,
  _installed_themes = vim.fn.getcompletion('', 'color'),
}

M._set_theme        = function()
  local selected = actions_state.get_selected_entry()
  vim.cmd.colorscheme(selected[1])
end

M._select_theme     = function(prompt_bufnr)
  M._set_theme()
  actions.close(prompt_bufnr)
end

M._get_next_theme   = function(prompt_bufnr)
  actions.move_selection_next(prompt_bufnr)
  M._set_theme()
end

M._get_prev_theme   = function(prompt_bufnr)
  actions.move_selection_previous(prompt_bufnr)
  M._set_theme()
end

M.win_opts          = {
  results_title    = ' Themes ',
  prompt_title     = ' Find your theme ',
  layout_strategy  = 'vertical',
  layout_config    = {
    height = 0.5,
    width = 0.5,
    prompt_position = 'top',
  },
  sorting_strategy = 'ascending',
}

M.opts              = {
  finder = M._finders.new_table(M._installed_themes),
  sorter = M._sorters.get_generic_fuzzy_sorter({}),
  attach_mappings = function(prompt_bufnr, map)
    map('i', '<CR>', M._select_theme)
    map('i', '<C-j>', M._get_next_theme)
    map('i', '<C-k>', M._get_prev_theme)
    map('i', '<Down>', M._get_next_theme)
    map('i', '<Up>', M._get_prev_theme)

    map('n', '<CR>', M._select_theme)
    map('n', 'j', M._get_next_theme)
    map('n', 'k', M._get_prev_theme)
    return true
  end
}

M._themes           = pickers.new(M.win_opts, M.opts)

return M
