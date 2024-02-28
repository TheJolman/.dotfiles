local global = vim.g
local o = vim.o

-- Map <leader>
global.mapleader = " "
global.maplocalleader = " "

-- use system clipboard
o.clipboard = 'unnamedplus'

o.resize_amount = 5
o.termguicolors = true

o.number = true
o.relativenumber = true
o.pumheight = 10
o.pumwidth = 10
o.cursorline = false
o.cursorline = true
o.syntax = "on"
o.expandtab = true
o.autoindent = true
o.shiftwidth = 2
o.tabstop = 2
o.wildmenu = true
o.showmatch = true


vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "/home/josh/School/SoftEng/TheProject/*",
  callback = function()
    vim.o.tabstop = 4
    vim.o.shiftwidth = 4
    vim.o.expandtab = true
  end,
})
