-- ======================================= --
-- =============== VIM CMD =============== --
-- ======================================= --
vim.cmd("syntax on")
vim.cmd([[
call plug#begin('~/.vim/plugged')
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'nvim-tree/nvim-tree.lua'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'nvim-mini/mini.icons'
	Plug 'nvim-mini/mini.pairs'
	Plug 'nvim-mini/mini.cursorword'
	Plug 'nvim-mini/mini.cmdline'
	Plug 'nvim-mini/mini.completion'
	Plug 'nvim-mini/mini.starter'
	Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
	Plug 'kylechui/nvim-surround'
	Plug 'neovim/nvim-lspconfig'
	Plug 'vague-theme/vague.nvim'
	Plug 'mg979/vim-visual-multi'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'L3MON4D3/LuaSnip'
	Plug 'saadparwaiz1/cmp_luasnip'
	Plug 'williamboman/mason.nvim'
	Plug 'williamboman/mason-lspconfig.nvim'
	Plug 'WhoIsSethDaniel/mason-tool-installer.nvim'
	Plug 'vyfor/cord.nvim'
	Plug 'MunifTanjim/nui.nvim'
	Plug 'VonHeikemen/searchbox.nvim'
call plug#end()
]])
vim.cmd.colorscheme("vague")
vim.cmd("highlight WinSeparator guifg=#141415 guibg=#141415") -- For vague theme

-- ================================================== --
-- =============== VIM CONFIGURATIONS =============== --
-- ================================================== --
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hidden = true
vim.opt.updatetime = 300
vim.opt.timeoutlen = 300
vim.opt.clipboard = "unnamedplus"
vim.opt.wildmenu = true
vim.opt.wildoptions = "pum"
vim.opt.fillchars = { eob = " " }
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
-- vim.opt.mouse = "a"
vim.opt.shortmess:append("c")
vim.opt.showmode = false
vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.showtabline = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.g.matchparen_timeout = 20
vim.g.mapleader = " "
vim.g.matchparen_insert_timeout = 20

-- ========================================= --
-- =============== REMAPPING =============== --
-- ========================================= --
vim.keymap.set('n', '<Esc>', ':noh<CR><Esc>', { noremap = true, silent = true })
vim.keymap.set('n', "<A-S-r>", ':source $MYVIMRC<CR>', { silent = true })

-- Remap Alt-j to Ctrl-n in normal and visual mode
vim.keymap.set({ "n", "x" }, "<A-j>", "<C-n>", { noremap = true })

-- Remap Alt-k to Ctrl-p in normal and visual mode
vim.keymap.set({ "n", "x" }, "<A-k>", "<C-p>", { noremap = true })

-- Remap Alt-j to Ctrl-n in insert mode
vim.keymap.set("i", "<A-j>", "<C-n>", { noremap = true })

-- Remap Alt-k to Ctrl-p in insert mode
vim.keymap.set("i", "<A-k>", "<C-p>", { noremap = true })

-- Remap Alt-j to Ctrl-n in command mode
vim.keymap.set("c", "<A-j>", "<C-n>", { noremap = true })

-- Remap Alt-k to Ctrl-p in command mode
vim.keymap.set("c", "<A-k>", "<C-p>", { noremap = true })

-- Remap Alt-j to Ctrl-n in terminal mode
vim.keymap.set("t", "<A-j>", "<C-n>", { noremap = true })

-- Remap Alt-k to Ctrl-p in terminal mode
vim.keymap.set("t", "<A-k>", "<C-p>", { noremap = true })

-- Remap Alt-q to :qa (quit all)
vim.keymap.set('n', '<A-S-q>', ':qa<CR>', { silent = true })

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
vim.keymap.set('n', '<A-l>', ':BufferLineCycleNext<CR>', { silent = true })
vim.keymap.set('n', '<C-Tab>', ':BufferLineCycleNext<CR>', { silent = true, desc = "Next buffer/tab" })
-- Remap Alt-h to BufferLineCyclePrev (previous tab)
vim.keymap.set('n', '<A-h>', ':BufferLineCyclePrev<CR>', { silent = true })
vim.keymap.set('n', '<C-S-Tab>', ':BufferLineCyclePrev<CR>', { silent = true, desc = "Previous buffer/tab" })

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
vim.keymap.set('n', '<A-w>', ':bd<CR>', { silent = true })

-- Remap Ctrl-k to signature help (function params)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help)

-- Remap Alt-b to toggle focus between NvimTree and workspace
vim.keymap.set('n', '<A-b>', function()
	local ok, api = pcall(require, 'nvim-tree.api')
	if not ok then return end
	if api.tree.is_visible() and api.tree.is_tree_buf() then
		vim.cmd('wincmd p')
	else
		api.tree.focus()
	end
end, { silent = true })

-- Remap Alt-Shift-B to toggle NvimTree
vim.keymap.set('n', '<A-S-B>', function()
	local ok, api = pcall(require, 'nvim-tree.api')
	if not ok then return end
	api.tree.toggle()
end, { silent = true, desc = 'Toggle NvimTree' })

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

-- Move line: Alt+Down = down, Alt+Down = up (Normal + Visual only)
vim.keymap.set('n', '<A-Down>', ':m .+1<CR>==', { noremap = true, silent = true })
vim.keymap.set('n', '<A-Up>', ':m .-2<CR>==', { noremap = true, silent = true })
vim.keymap.set('v', '<A-Down>', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', '<A-Up>', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Multi cursor: Shfit+Alt+Down = add below, Shift+Alt+Up = add above
vim.keymap.set({ "n", "x" }, "<S-A-Down>", "<Plug>(VM-Add-Cursor-Down)", { desc = "Add cursor below" })
vim.keymap.set({ "n", "x" }, "<S-A-Up>", "<Plug>(VM-Add-Cursor-Up)", { desc = "Add cursor above" })

-- Multi cursor: ga = select all instance (whole word)
vim.keymap.set({ "n", "x" }, "ga", ":MultipleCursorsAddMatches<CR>", { desc = "Add cursor at all instances" })

-- Multi cursor: gA = select all strings
vim.keymap.set({ "n", "x" }, "gA", ":MultipleCursorsAddMatchesV<CR>",
	{ desc = "Add cursor at all substring matches" })

-- Searchbox plug hotkey
vim.keymap.set('n', '<leader>s', ':SearchBoxIncSearch<CR>')
vim.keymap.set('n', '<leader>r', ':SearchBoxReplace<CR>', { desc = "Search & Replace" })
vim.keymap.set('v', '<leader>r', ':SearchBoxReplace visual_mode=true<CR>', { desc = "Replace selection" })

-- Remap Alt+Shift+F to format/indent entire file (gg=G)
vim.keymap.set('n', '<A-S-f>', 'mzgg=G`z', { noremap = true, silent = true, desc = "Format file and restore cursor" })

-- Remap F5 to run current file
vim.keymap.set('n', '<F5>', function()
	vim.cmd('w')
	local ft = vim.bo.filetype
	local file = vim.fn.expand('%')
	local file_noext = vim.fn.expand('%<')

	if ft == 'python' then
		vim.cmd('split | terminal python "' .. file .. '"')
	elseif ft == 'c' then
		vim.cmd('split | terminal gcc "' .. file .. '" -o "' .. file_noext .. '" && "' .. file_noext .. '"')
	elseif ft == 'cpp' then
		vim.cmd('split | terminal g++ "' .. file .. '" -o "' .. file_noext .. '" && "' .. file_noext .. '"')
	elseif ft == 'javascript' then
		vim.cmd('split | terminal node "' .. file .. '"')
	elseif ft == 'lua' then
		vim.cmd('split | terminal lua "' .. file .. '"')
	else
		print("Can not run file with type: " .. ft)
	end
end, { silent = true, desc = "Run current file" })

-- ============================================== --
-- =============== ENABLE PLUGINS =============== --
-- ============================================== --

require('vim._core.ui2').enable()
require('nvim-treesitter').setup({
	ensure_installed = { "c", "lua", "python", "json", "toml" },
	auto_install = true,
	highlight = {
		enable = true,
	},
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
		lualine_c = {
			-- { 'filename', path = 1 },
			'diagnostics'
		},
		lualine_x = {
		},
		lualine_y = {
			{
				function()
					return "ฅ^•ﻌ•^ฅ"
				end
			}
			,
			-- 'mode',
		},
		lualine_z = {
			{
				function() return os.date("%H:%M") end,
			}
		}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	}
})
require('bufferline').setup()
require('nvim-tree').setup({
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
	view = {
		width = 30,
		side = 'right',
		adaptive_size = true,
	},
	renderer = {
		group_empty = false,
		root_folder_label = ":t",
		highlight_git = true,
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = false,
				git = false,
			}
		}
	},
	git = {
		enable = true,
		ignore = false,
	},
	filters = {
		dotfiles = false,
		custom = {
			"^\\.git$",
			"^node_modules$",
			"^\\.godot$",
			"^\\.nomedia$",
			"^\\.import$",
			"^export\\.cfg$",
			"^export_credentials\\.cfg$",
			"\\.tmp$",
			"\\.translation$",
			"^\\.mono$",
			"^data_.*$",
			"^mono_crash\\..*\\.json$",
			"^debug$",
			"^target$",
			"\\.rs\\.bk$",
			"\\.pdb$",
			"^mutants\\.out.*$",
			"^__pycache__$",
			"\\.py[codz]$",
			"\\$py\\.class$",
			"\\.so$",
			"^\\.Python$",
			"^build$",
			"^develop-eggs$",
			"^dist$",
			"^downloads$",
			"^eggs$",
			"^\\.eggs$",
			"^lib$",
			"^lib64$",
			"^parts$",
			"^sdist$",
			"^var$",
			"^wheels$",
			"\\.egg-info$",
			"^\\.installed\\.cfg$",
			"\\.egg$",
			"^MANIFEST$",
			"\\.manifest$",
			"\\.spec$",
			"^pip-log\\.txt$",
			"^pip-delete-this-directory\\.txt$",
			"^htmlcov$",
			"^\\.tox$",
			"^\\.nox$",
			"^\\.coverage$",
			"^\\.coverage\\..*$",
			"^\\.cache$",
			"^nosetests\\.xml$",
			"^coverage\\.xml$",
			"\\.cover$",
			"\\.py\\.cover$",
			"^\\.hypothesis$",
			"^\\.pytest_cache$",
			"^cover$",
			"\\.mo$",
			"\\.pot$",
			"\\.log$",
			"^local_settings\\.py$",
			"^db\\.sqlite3$",
			"^db\\.sqlite3-journal$",
			"^instance$",
			"^\\.webassets-cache$",
			"^\\.scrapy$",
			"^docs/_build$",
			"^\\.pybuilder$",
			"^\\.ipynb_checkpoints$",
			"^profile_default$",
			"^ipython_config\\.py$",
			"^\\.abstra$",
			"^\\.ruff_cache$",
			"^\\.pypirc$",
			"^marimo/_static$",
			"^marimo/_lsp$",
			"^__marimo__$",
			"^\\.streamlit/secrets\\.toml$",
			"^logs$",
			"^npm-debug\\.log\\*$",
			"^yarn-debug\\.log\\*$",
			"^yarn-error\\.log\\*$",
			"^lerna-debug\\.log\\*$",
			"^report\\..*\\.json$",
			"^pids$",
			"\\.pid$",
			"\\.seed$",
			"\\.pid\\.lock$",
			"^lib-cov$",
			"^coverage$",
			"\\.lcov$",
			"^\\.nyc_output$",
			"^\\.grunt$",
			"^bower_components$",
			"^\\.lock-wscript$",
			"^web_modules$",
			"\\.tsbuildinfo$",
			"^\\.npm$",
			"^\\.eslintcache$",
			"^\\.stylelintcache$",
			"^\\.node_repl_history$",
			"\\.tgz$",
			"^\\.yarn-integrity$",
			"^\\.env$",
			"^\\.env\\..*$",
			"^\\.parcel-cache$",
			"^\\.next$",
			"^out$",
			"^\\.nuxt$",
			"^\\.output$",
			"^\\.vuepress/dist$",
			"^\\.temp$",
			"^\\.svelte-kit$",
			"^\\.vitepress/dist$",
			"^\\.vitepress/cache$",
			"^\\.docusaurus$",
			"^\\.serverless$",
			"^\\.fusebox$",
			"^\\.dynamodb$",
			"^\\.firebase$",
			"^\\.tern-port$",
			"^\\.vscode-test$",
			"^\\.pnp\\..*$",
			"^\\.yarn$",
			"^vite\\.config\\.js\\.timestamp-.*$",
			"^vite\\.config\\.ts\\.timestamp-.*$",
			"^\\.vite$",
			"^\\.vscode$",
			"^\\.pio$",
			"^\\.godot$",
			"^\\.import$",
			"\\.import$",
			"\\.tmp$",
			"\\.godot$",
			"\\.uid$",
			"\\.translation$",
		}
	}
})
require("nvim-surround").setup({})
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
require('cord').setup({
	variables = true,
	text = {
		workspace = '',
		viewing = "Viewing ${filename}",
		editing = "Editing ${filename}",
	},
})
require('mini.cursorword').setup()
require('mini.cmdline').setup()
require('mini.completion').setup()
require('mini.starter').setup()
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		if vim.fn.argc() == 0 then
			require("nvim-tree.api").tree.close()
			pcall(require('mini.starter').open)
		end
	end,
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
})
vim.lsp.enable('basedpyright')

-- C/Cpp LSP
vim.lsp.config('clangd', {
	cmd = { 'clangd', '--background-index', '--clang-tidy' },
	init_options = {
		fallbackFlags = { '-std=c23' }
	}
})
vim.lsp.enable('clangd')

-- GDScript
vim.lsp.config['gdscript'] = {
	cmd = { "nc", "localhost", "6008" },
	root_markers = { "project.godot" },
}
vim.lsp.enable('gdscript')

-- ============================================= --
-- =============== AUTO COMMANDS =============== --
-- ============================================= --

-- Automatically opening NvimTree when launched
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		require("nvim-tree.api").tree.open()
	end
})

-- Auto saving file when losing focus (đã đổi từ TextChanged sang InsertLeave, BufLeave để hết tốn CPU)
vim.api.nvim_create_autocmd({ "InsertLeave", "BufLeave" }, {
	callback = function()
		if vim.bo.modifiable and vim.bo.buftype == "" and vim.fn.expand('%') ~= '' then
			vim.cmd("silent! w")
		end
	end
})

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_create_autocmd("VimResized", {
	pattern = "*",
	command = "wincmd =",
})
