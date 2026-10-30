-- ================================================== --
-- =============== VIM CONFIGURATIONS =============== --
-- ================================================== --
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hidden = true
vim.opt.updatetime = 300
vim.opt.clipboard = "unnamedplus"
vim.opt.wildmenu = true
vim.opt.wildoptions = "pum"
vim.cmd("syntax on")
vim.g.mapleader = " "

-- ========================================= --
-- =============== REMAPPING =============== --
-- ========================================= --
local modes = { "n", "i", "c", "t", "x" }
-- Remap Alt-j to Ctrl-n in normal and visual mode
vim.keymap.set({ "n", "x" }, "<M-j>", "<C-n>", { noremap = true })
-- Remap Alt-k to Ctrl-p in normal and visual mode
vim.keymap.set({ "n", "x" }, "<M-k>", "<C-p>", { noremap = true })
-- Remap Alt-j to Ctrl-n in insert mode
vim.keymap.set("i", "<M-j>", "<C-n>", { noremap = true })
-- Remap Alt-k to Ctrl-p in insert mode
vim.keymap.set("i", "<M-k>", "<C-p>", { noremap = true })
-- Remap Alt-j to Ctrl-n in command mode
vim.keymap.set("c", "<M-j>", "<C-n>", { noremap = true })
-- Remap Alt-k to Ctrl-p in command mode
vim.keymap.set("c", "<M-k>", "<C-p>", { noremap = true })
-- Remap Alt-j to Ctrl-n in terminal mode
vim.keymap.set("t", "<M-j>", "<C-n>", { noremap = true })
-- Remap Alt-k to Ctrl-p in terminal mode
vim.keymap.set("t", "<M-k>", "<C-p>", { noremap = true })
-- Remap Alt-q to :qa (quit all)
vim.keymap.set('n', '<M-q>', ':qa<CR>', { silent = true })
-- Remap Space-e to open diagnostic float
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
-- Remap Space-q to open diagnostics in loclist
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
-- Remap Ctrl-e to Telescope find_files
vim.keymap.set('n', '<C-e>', ':Telescope find_files<CR>', { silent = true })
-- Remap Ctrl-Shift-e to Telescope oldfiles (recent files)
vim.keymap.set('n', '<C-S-e>', ':Telescope oldfiles<CR>', { silent = true })
-- Remap [d to previous diagnostic
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev) 
-- Remap ]d to next diagnostic
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- Remap Alt-l to BufferLineCycleNext (next tab)
vim.keymap.set('n', '<M-l>', ':BufferLineCycleNext<CR>', { silent = true })
-- Remap Alt-h to BufferLineCyclePrev (previous tab)
vim.keymap.set('n', '<M-h>', ':BufferLineCyclePrev<CR>', { silent = true })
-- Remap gd to go to definition
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
-- Remap gD to go to declaration
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
-- Remap gr to go to references
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
-- Remap K to hover documentation
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
-- Remap Space-cd to cd to current file's directory
vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>', { silent = true })
-- Remap Alt-w to close current buffer
vim.keymap.set('n', '<M-w>', ':bd<CR>', { silent = true })
-- Remap Ctrl-k to signature help (function params)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)
-- Remap Alt-b to toggle focus between NvimTree and workspace
vim.keymap.set('n', '<M-b>', function()
  local api = require('nvim-tree.api')
  if vim.bo.filetype == 'NvimTree' then
    vim.cmd('wincmd l')
  else
    api.tree.focus()
  end
end, { silent = true })
-- Remap Ctrl-Shift-` to close error window and focus back to file
vim.keymap.set('n', '<C-S-`>', function()
  vim.cmd('lclose')
  vim.cmd('cclose')
  vim.cmd('wincmd p')
end, { noremap = true, silent = true })
-- Remap Ctrl-` to toggle focus between workspace and error window
vim.keymap.set('n', '<C-`>', function()
  local win = vim.fn.getloclist(0, { winid = 0 }).winid
  if win ~= 0 and vim.api.nvim_get_current_win() == win then
    vim.cmd('wincmd p')
  else
    vim.diagnostic.setloclist({ open = true })
    if win ~= 0 then
      vim.api.nvim_set_current_win(win)
    end
  end
end, { noremap = true, silent = true })

-- ======================================= --
-- =============== VIM CMD =============== --
-- ======================================= --
vim.cmd([[
call plug#begin('~/.vim/plugged')
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
    Plug 'kylechui/nvim-surround'
    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'vague-theme/vague.nvim'
    Plug 'echasnovski/mini.icons'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
call plug#end()
]])
vim.cmd.colorscheme("vague")
vim.opt.termguicolors = true

-- ============================================== --
-- =============== IMPORT PLUGINS =============== --
-- ============================================== --
require('lualine').setup()
require('bufferline').setup()
require('nvim-tree').setup({
  sync_root_with_cwd = true,
  renderer = { icons = { show = { file = true, folder = true } } },
  view = { width = 30 },
  renderer = { group_empty = true }
})
require("nvim-surround").setup({})
require('mini.icons').setup({ style = 'glyph' })
require('mini.icons').mock_nvim_web_devicons()
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'basedpyright',
    'clangd',    
    'lua_ls',
    'marksman',
  }
})

-- ================================================== --
-- =============== AUTOCOMPLETE SETUP =============== --
-- ================================================== --
local cmp = require('cmp')
cmp.setup({
  snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
  mapping = cmp.mapping.preset.insert({
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  })
})

-- ========================================= --
-- =============== LSP SETUP =============== --
-- ========================================= --

-- Python LSP
vim.lsp.config('basedpyright', {
  cmd = { 'basedpyright-langserver', '--stdio' },
  capabilities = require('cmp_nvim_lsp').default_capabilities()
})
vim.lsp.enable('basedpyright')

-- C/Cpp LSP
vim.lsp.config('clangd', {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  cmd = { 'clangd' }
})
vim.lsp.enable('clangd')


-- ============================================= --
-- =============== AUTO COMMANDS =============== --
-- ============================================= --

-- Automatically reloading init.lua file
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "init.lua",
  command = "source %"
})

-- Automatically opening NvimTree when launched
vim.api.nvim_create_autocmd("VimEnter", { 
  callback = function()
    require("nvim-tree.api").tree.open()
  end
})

-- Auto saving file when losing focus
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
  callback = function()
    if vim.bo.modifiable and vim.bo.buftype == "" then
      vim.cmd("silent! w")
    end
  end
})
