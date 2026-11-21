local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('vim._core.ui2').enable()
require("core.options")
require("core.keymaps")

require("lazy").setup({
	{ "vague-theme/vague.nvim" },
	{ "dgox16/oldworld.nvim" },
	{ "nvim-lualine/lualine.nvim" },
	{ "akinsho/bufferline.nvim" },
	{ "goolord/alpha-nvim" },
	{ "nvim-tree/nvim-web-devicons" },

	{ "nvim-lua/plenary.nvim" },
	{ "MunifTanjim/nui.nvim" },

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	{ "nvim-mini/mini.icons" },
	{ "nvim-mini/mini.pairs" },
	{ "nvim-mini/mini.cursorword" },
	{ "nvim-mini/mini.cmdline" },
	{ "nvim-mini/mini.completion" },

	{ "kylechui/nvim-surround" },
	{ "mg979/vim-visual-multi" },
	{ "VonHeikemen/searchbox.nvim" },
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-tree/nvim-tree.lua" },

	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "WhoIsSethDaniel/mason-tool-installer.nvim" },

	{ "vyfor/cord.nvim" },
})

require("plugins.alpha")
require("plugins.bufferline")
require("plugins.lualine")
require("plugins.mason")
require("plugins.mini")
require("plugins.nvim-surround")
require("plugins.nvim-tree")
require("plugins.telescope")
require("plugins.nvim-treesitter")
require("plugins.cord")
require("core.commands")
require("core.lsp")
