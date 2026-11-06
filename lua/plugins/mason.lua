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
