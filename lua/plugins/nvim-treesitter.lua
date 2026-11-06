require('nvim-treesitter').setup({
	ensure_installed = { "c", "lua", "python", "json", "toml", "gdscript" },
	auto_install = true,
	highlight = { enable = true },
})
