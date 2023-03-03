# Neovim UI theme picker plugin

Did you ever wanted to change a theme, but you had to enter ```COMMAND``` mode and call ```:colorscheme your_theme``` to see how it looks?

And then you will have to repeat this proccess over and over again.

With this plugin, you will have a UI from where to choose your desired theme. Not only that, but you will be able to see the theme before applying it.

## Guide

1. [Introduction](#introduction)
    - [Requirements](#requirements)
2. [Installation](#installation)
    - [Packer](#packer)
    - [Plug](#plug)
3. [Configuration](#configuration)

## Introduction

This plugin uses [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) to create the UI and customize it.

Im working on doing one from scracth. But for now, they did a great job and telescope has a nice API to work with.

### Requirements

🔭 You must have installed [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) for this plugin to work.

## Installation

The installation proccess is simple. Depending on what plugin manager you use, it might be different.

I will show how using [packer.nvim](https://github.com/wbthomason/packer.nvim) and [vim-plug](https://github.com/junegunn/vim-plug).

### Packer

```lua
-- plugin installation file. Example: plugins.lua
require('packer').startup(function(use)
  -- plugins
  use 'AlejandroSuero/theme-picker.nvim'
end)
```

### Plug

```vim9script
call plug#begin()
  " Plugins
  Plug 'AlejandroSuero/theme-picker.nvim'
call plug#end()
```

## Configuration

The configuration, for now it's just adding function call to your own mappings.

```lua
vim.keymap.set('n', '<leader>ct', ':lua require("themepicker").open_menu()<CR>', opts)
```
