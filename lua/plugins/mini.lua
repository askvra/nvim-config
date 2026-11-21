require('mini.icons').setup({ style = 'glyph' })
require('mini.icons').mock_nvim_web_devicons()
require('mini.pairs').setup()
require('mini.cursorword').setup()
require('mini.cmdline').setup()
require('mini.completion').setup({
  lsp_completion = {
    source_func = 'omnifunc',
    auto_setup = true,
  },
  delay = {
    completion = 10,
    info = 100,
    signature = 50,
  },
  window = {
    info = { border = 'single' },
    signature = { border = 'single' },
  },
  mappings = {
    force_twostep = '<C-Space>',
  },
})
