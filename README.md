# nvim config
> Migrating from code editor.

**REQUIREMENTS**:
- [vim-plug](https://github.com/junegunn/vim-plug)

---

### Key Notation
- A: Alt key
- C: Ctrl key
- S: Shift key
- leader: Space key (Space + e = leader + e)

### Navigation & Completion
- `<A-j>`: Next item, replace `<C-n>`
- `<A-k>`: Previous item, replace `<C-p>`
- `<A-Down>`: Move the current line down
- `<A-Up>`: Move the current line up
- `<A-S-Down>`: Add a new cursor below
- `<A-S-Up>`: Add a new cursor above

### Files & Tabs
- `<C-e>`: Open file finder
- `<C-S-e>`: Open recent files
- `<A-b>`: Toggle focus between NvimTree and workspace
- `<A-S-b>`: Close NvimTree
- `<A-l>` or `<C-Tab>`: Next buffer/tab
- `<A-h>` or `<C-Shift-Tab>`: Previous buffer/tab
- `<A-w>`: Close current buffer/tab
- `<A-S-q>`: Quit all

### Search & Replace
- `<leader>s`: Open searching box
- `<leader>r`: Open replacing box

### LSP - Go to & Docs
- `gd`: Go to definition
- `gD`: Go to declaration
- `gr`: Go to references
- `K`: Show hover docs
- `<C-k>`: Show function params

### Diagnostics
- `<Space-e>`: Show error under cursor
- `<Space-q>`: Open all errors
- `[d`: Previous diagnostic
- `]d`: Next diagnostic
- ``<C-`>``: Toggle focus error window
- ``<C-S-`>``: Hide error window
  
### Others
- `<F5>`: Run current file
- `<A-S-f>`: Format current file, replace `<mzgg=G`z>`
- `<A-S-r>`: Reload init.lua file
