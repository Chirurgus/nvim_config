vim.cmd([[
call plug#begin()
Plug 'jalvesaq/Nvim-R'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'
call plug#end()
]])

-- nvim-tree setup
-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()
vim.opt.encoding = "utf-8" 
vim.opt.clipboard = "unnamedplus"

-- Nvim-R
vim.g.R_path = "C:\\Program Files\\R\\R-4.2.2\\bin"

-- Useful commands
vim.o.background = "light"
vim.cmd("colorscheme one")

-- GuiFont :[lbi] # optionally for light bold or italic
vim.opt.guifont='Consolas:h14'

-- Don't force me to write buffer before opening another one
vim.o.hidden = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Keymaps
vim.keymap.set('i', '<C-BS>', '<C-W>')

