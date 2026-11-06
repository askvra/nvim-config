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
