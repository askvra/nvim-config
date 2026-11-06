-- Python
vim.lsp.config('basedpyright', {
	cmd = { 'basedpyright-langserver', '--stdio' },
})
vim.lsp.enable('basedpyright')

-- C/C++
vim.lsp.config('clangd', {
	cmd = { 'clangd', '--background-index', '--clang-tidy' },
	init_options = { fallbackFlags = { '-std=c23' } }
})
vim.lsp.enable('clangd')

-- GDscript
vim.lsp.config['gdscript'] = {
	cmd = { "nc", "localhost", "6008" },
	root_markers = { "project.godot" },
}
vim.lsp.enable('gdscript')
