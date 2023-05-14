vim.cmd([[
call plug#begin()
Plug 'jalvesaq/Nvim-R'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-telescope/telescope-fzf-native.nvim'
call plug#end()

let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';'
let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
let &shellpipe  = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'
set shellquote= shellxquote=
]])

-- Telescope
require('telescope').setup()

-- Nvim-R
vim.g.R_path = "C:\\Program Files\\R\\R-4.2.2\\bin"
vim.g.R_assign = false
vim.g.R_rmdchunk = false

-- Setup colors
vim.o.background = "light"
vim.cmd("colorscheme one")

-- GuiFont :[lbi] # optionally for light bold or italic
vim.opt.guifont='Consolas:h14'

-- Don't force me to write buffer before opening another one
vim.o.hidden = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.encoding = "utf-8" 
vim.o.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.colorcolumn = "80,60"

-- Don't wrap text
vim.o.textwidth = 0 
vim.o.wrapmargin = 0
vim.o.wrap = false
vim.o.linebreak = false

-- Keymaps - normal
vim.keymap.set("n", "<Leader>h", ":NvimTreeToggle<cr>")
vim.keymap.set("n", "<C-cr>", "\ba") -- Source block echo and down

-- Keymaps - insert
vim.keymap.set('i', '<C-BS>', '<C-W>')

-- NvimTree setup
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function nvim_tree_on_attach(bufnr)
    local api = require('nvim-tree.api')
    local function opts(desc)
      return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    local function edit_or_open()
      local node = api.tree.get_node_under_cursor()

      if node.nodes ~= nil then
        -- expand or collapse folder
        api.node.open.edit()
      else
        -- open file
        api.node.open.edit()
        -- Close the tree if file was opened
        api.tree.close()
      end
    end
    -- open as vsplit on current node
    local function vsplit_preview()
      local node = api.tree.get_node_under_cursor()

      if node.nodes ~= nil then
        -- expand or collapse folder
        api.node.open.edit()
      else
        -- open file as vsplit
        api.node.open.vertical()
      end

      -- Finally refocus on tree if it was lost
      api.tree.focus()
    end
    -- all default mappings
    api.config.mappings.default_on_attach(bufnr)
    vim.keymap.set("n", "l", edit_or_open,          opts("Edit Or Open"))
    vim.keymap.set("n", "<cr>", edit_or_open,          opts("Edit Or Open"))
    vim.keymap.set("n", "L", vsplit_preview,        opts("Vsplit Preview"))
    vim.keymap.set("n", "h", api.tree.close,        opts("Close"))
    vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
end

require("nvim-tree").setup({
    on_attach = nvim_tree_on_attach,
})

-- TODO :
--
-- R console colors
-- Spell check suggestions too clucky with z=
-- Make block mode insert interactive
-- Integrate ltex-ls
-- Integrate latex
-- Integrate comiling rmd
-- Implement C-<cr> for sending to console
-- Improve Rmd's Math highlighting (Don't highlight _*_ in markdown)
-- have Nvimtree follow :c within the same window
