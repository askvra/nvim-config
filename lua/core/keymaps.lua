-- ========================================= --
-- =============== REMAPPING =============== --
-- ========================================= --
vim.keymap.set('n', '<Esc>', ':noh<CR><Esc>', { noremap = true, silent = true })
vim.keymap.set('n', "<A-S-r>", function()
  -- Clear require cache for your configuration modules (adjust the pattern to match your module prefix)
  for name, _ in pairs(package.loaded) do
    if name:match("^config") or name:match("^plugins") then -- Change prefix to match your module names
      package.loaded[name] = nil
    end
  end

  dofile(vim.env.MYVIMRC)
  print("Config and require cache reloaded!")
end, { silent = true, desc = "Reload Lua config and clear cache" })

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

-- F5 to run code
vim.keymap.set("n", "<F5>", function()
  vim.cmd("write")
  local filetype = vim.bo.filetype
  local filepath = vim.fn.expand('%:p')
  local outpath = vim.fn.expand('%:p:r') .. ".exe"
  local cmd = ""

  if filetype == "python" then
    cmd = "python3 " .. vim.fn.shellescape(filepath)
  elseif filetype == "javascript" then
    cmd = "node " .. vim.fn.shellescape(filepath)
  elseif filetype == "lua" then
    cmd = "lua " .. vim.fn.shellescape(filepath)
  elseif filetype == "c" then
    cmd = string.format("gcc %s -o %s && %s", vim.fn.shellescape(filepath), vim.fn.shellescape(outpath), vim.fn.shellescape(outpath))
  elseif filetype == "cpp" then
    cmd = string.format("g++ %s -o %s && %s", vim.fn.shellescape(filepath), vim.fn.shellescape(outpath), vim.fn.shellescape(outpath))
  else
    print("Execution not supported for filetype: " .. filetype)
    return
  end

  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

  vim.fn.termopen(cmd)
  vim.cmd("startinsert")
end, { desc = "Run file with Ctrl-Alt-N" })
