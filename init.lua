vim.cmd("syntax on")
vim.cmd([[
call plug#begin('~/.vim/plugged')
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'nvim-tree/nvim-tree.lua'
	Plug 'nvim-mini/mini.icons'
	Plug 'nvim-mini/mini.pairs'
	Plug 'nvim-mini/mini.cursorword'
	Plug 'nvim-mini/mini.cmdline'
	Plug 'nvim-mini/mini.completion'
	Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
	Plug 'kylechui/nvim-surround'
	Plug 'neovim/nvim-lspconfig'
	Plug 'vague-theme/vague.nvim'
	Plug 'mg979/vim-visual-multi'
	Plug 'williamboman/mason.nvim'
	Plug 'williamboman/mason-lspconfig.nvim'
	Plug 'WhoIsSethDaniel/mason-tool-installer.nvim'
	Plug 'MunifTanjim/nui.nvim'
	Plug 'VonHeikemen/searchbox.nvim'
	Plug 'goolord/alpha-nvim'
  Plug 'nvim-tree/nvim-web-devicons'
call plug#end()
]])

require('vim._core.ui2').enable()
require("core.options")
require("core.keymaps")

require("plugins.alpha")
require("plugins.bufferline")
require("plugins.lualine")
require("plugins.mason")
require("plugins.mini")
require("plugins.nvim-surround")
require("plugins.nvim-tree")
require("plugins.nvim-treesitter")

require("core.commands")
require("core.lsp")
