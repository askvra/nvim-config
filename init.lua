-- ======================================= --
-- =============== VIM CMD =============== --
-- ======================================= --
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

-- ================================================== --
-- =============== VIM CONFIGURATIONS =============== --
-- ================================================== --

vim.cmd.colorscheme("vague")
vim.cmd("highlight WinSeparator guifg=#141415 guibg=#141415")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none" })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", fg = "#767676" })
vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none" })

-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.mouse = ""
vim.opt.clipboard = "unnamedplus"
vim.opt.shortmess:append("I")
vim.g.termfeatures = {
	osc52 = false,
}

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Visual settings
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.cmdheight = 0
vim.opt.laststatus = 0
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.showmode = false
vim.opt.pumheight = 10
vim.opt.pumblend = 10
vim.opt.winblend = 0
vim.opt.conceallevel = 0
vim.opt.concealcursor = ""
vim.opt.synmaxcol = 300
vim.opt.fillchars = { eob = " " }

-- ========================================= --
-- =============== REMAPPING =============== --
-- ========================================= --
vim.keymap.set('n', '<Esc>', ':noh<CR><Esc>', { noremap = true, silent = true })
vim.keymap.set('n', "<A-S-r>", ':source $MYVIMRC<CR>', { silent = true })

-- Alt mappings for navigation
vim.keymap.set({ "n", "x", "i", "c", "t" }, "<A-j>", "<C-n>", { noremap = true })
vim.keymap.set({ "n", "x", "i", "c", "t" }, "<A-k>", "<C-p>", { noremap = true })

vim.keymap.set('n', '<A-S-q>', ':qa<CR>', { silent = true })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
vim.keymap.set('n', '<C-e>', ':Telescope find_files<CR>', { silent = true })
vim.keymap.set('n', '<C-S-e>', ':Telescope oldfiles<CR>', { silent = true })

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

vim.keymap.set('n', '<A-l>', ':BufferLineCycleNext<CR>', { silent = true })
vim.keymap.set('n', '<C-Tab>', ':BufferLineCycleNext<CR>', { silent = true })
vim.keymap.set('n', '<A-h>', ':BufferLineCyclePrev<CR>', { silent = true })
vim.keymap.set('n', '<C-S-Tab>', ':BufferLineCyclePrev<CR>', { silent = true })

vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gr', vim.lsp.buf.references)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)

vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>', { silent = true })
vim.keymap.set('n', '<A-w>', ':bd<CR>', { silent = true })
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)

-- Move lines
vim.keymap.set('n', '<A-Down>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.keymap.set('n', '<A-Up>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.keymap.set('v', '<A-Down>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', '<A-Up>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Searchbox
vim.keymap.set('n', '<leader>s', ':SearchBoxIncSearch<CR>')
vim.keymap.set('n', '<leader>r', ':SearchBoxReplace<CR>')
vim.keymap.set('v', '<leader>r', ':SearchBoxReplace visual_mode=true<CR>')
vim.keymap.set('n', '<A-S-f>', 'mzgg=G`z', { noremap = true, silent = true })

-- ============================================== --
-- =============== ENABLE PLUGINS =============== --
-- ============================================== --
require('vim._core.ui2').enable()
require('nvim-treesitter').setup({
	ensure_installed = { "c", "lua", "python", "json", "toml", "gdscript" },
	auto_install = true,
	highlight = { enable = true },
})

require('lualine').setup({
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = { statusline = { 'NvimTree', 'packer', 'lazy' } },
	},
	sections = {
		lualine_a = { 'hostname' },
		lualine_b = { 'branch', 'diff' },
		lualine_c = { 'diagnostics' },
		lualine_x = {},
		lualine_y = { { function() return "ฅ^•ﻌ•^ฅ" end } },
		lualine_z = { { function() return os.date("%H:%M") end } }
	},
})

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 30,
		side = "left",
	},
	renderer = {
		group_empty = true,
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = false,
			},
		},
	},
	filters = {
		dotfiles = false,
	},
	actions = {
		open_file = {
			quit_on_open = false,
		},
	},
})

require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 30,
		side = "right",
		float = {
			enable = false,
		}
	},
	renderer = {
		root_folder_label = false,
		group_empty = true,
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
		},
	},
	filters = {
		dotfiles = false,
	},
	actions = {
		open_file = {
			quit_on_open = false, },
	},
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
})
vim.keymap.set('n', '<A-S-b>', '<CMD>NvimTreeToggle<CR>', { desc = "Toggle NvimTree" })
vim.keymap.set('n', '<A-b>', function()
	if vim.bo.filetype == "NvimTree" then
		vim.cmd('wincmd p')
	else
		local ok = pcall(vim.cmd, 'NvimTreeFocus')
		if not ok then
			vim.cmd('NvimTreeOpen')
		end
	end
end, { desc = "Toggle focus between code and NvimTree" })
require('bufferline').setup({
	options = {
		always_show_bufferline = true,
	},
})
require("nvim-surround").setup()
require('mini.icons').setup({ style = 'glyph' })
require('mini.icons').mock_nvim_web_devicons()
require('mini.pairs').setup()
require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = {
		'basedpyright',
		'clangd',
		'lua_ls',
		'taplo',
		'jsonls',
		'marksman',
	}
})
require('mason-tool-installer').setup({
	ensure_installed = {
		'black',
		'prettier',
		'clang-format',
		'stylua',
		'taplo',
		'ruff',
	}
})
require('mini.cursorword').setup()
require('mini.cmdline').setup()
require('mini.completion').setup({
	window = {
		info = { border = 'single' },
		signature = { border = 'single' },
	},
})

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end
local dashboard = require("alpha.themes.dashboard")
dashboard.section.buttons.val = {
	dashboard.button("e", "  New File", ":enew <CR>"),
	dashboard.button("f", "󰱼  Find File", ":Telescope find_files<CR>"),
	dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
	dashboard.button("t", "󰙅  File Explorer", ":NvimTreeToggle<CR>"),
	dashboard.button("s", "  Settings (init.lua)", ":e $MYVIMRC <CR>"),
	dashboard.button("q", "󰗼  Quit Neovim", ":qa<CR>"),
}
alpha.setup(dashboard.opts)

-- ========================================= --
-- =============== LSP SETUP =============== --
-- ========================================= --

vim.lsp.config('basedpyright', {
	cmd = { 'basedpyright-langserver', '--stdio' },
})
vim.lsp.enable('basedpyright')

vim.lsp.config('clangd', {
	cmd = { 'clangd', '--background-index', '--clang-tidy' },
	init_options = { fallbackFlags = { '-std=c23' } }
})
vim.lsp.enable('clangd')

vim.lsp.config['gdscript'] = {
	cmd = { "nc", "localhost", "6008" },
	root_markers = { "project.godot" },
}
vim.lsp.enable('gdscript')

-- ============================================= --
-- =============== AUTO COMMANDS =============== --
-- ============================================= --
vim.api.nvim_create_autocmd({ "InsertLeave", "BufLeave" }, {
	callback = function()
		if vim.bo.modifiable and vim.bo.buftype == "" and vim.fn.expand('%') ~= '' then
			vim.cmd("silent! w")
		end
	end
})
vim.api.nvim_create_autocmd("VimResized", {
	pattern = "*",
	command = "wincmd =",
})
vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and vim.bo["filetype"] == "nvimtree" then
			vim.cmd("quit")
		end
	end,
})
