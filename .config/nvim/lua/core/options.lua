vim.o.autoindent = true -- Copy indent from current line when starting a new one
vim.o.backspace = 'indent,eol,start' -- Allow backspace over indent, line breaks, and start of insert
vim.o.backup = false -- Disable creating backup files
vim.o.breakindent = true -- Wrapped lines maintain indent visually
vim.o.clipboard = 'unnamedplus' -- Use system clipboard for all yank, delete, paste
vim.o.completeopt = 'menuone,noselect' -- Better completion experience with menu and no auto select
vim.o.conceallevel = 0 -- Show concealed text (e.g., in Markdown)
vim.o.cursorline = true -- Highlight the current line
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.fileencoding = 'utf-8' -- File encoding for writing
vim.o.hlsearch = false -- Disable persistent search highlight
vim.o.inccommand = 'split' -- Show command effects incrementally in split
vim.o.ignorecase = true -- Case-insensitive search
vim.o.linebreak = true -- Do not split words when wrapping
vim.o.list = true -- Show whitespace characters
vim.o.mouse = 'a' -- Enable mouse support in all modes
vim.o.number = true -- Show line numbers
vim.o.numberwidth = 4 -- Width of the number column
vim.o.pumheight = 10 -- Height of pop-up completion menu
vim.o.relativenumber = true -- Show relative line numbers
vim.o.scrolloff = 5 -- Minimal lines above/below cursor when scrolling
vim.o.shiftwidth = 4 -- Spaces to use for each indentation
vim.o.showmode = false -- Hide mode message like -- INSERT --
vim.o.showtabline = 1 -- Show tabline only if multiple tabs
vim.o.sidescrolloff = 8 -- Minimal columns left/right of cursor when scrolling horizontally
vim.o.smartcase = true -- Case-sensitive search when uppercase letters used
vim.o.smartindent = true -- Automatic smart indentation
vim.o.softtabstop = 4 -- Number of spaces per Tab when editing
vim.o.shell = '/usr/bin/zsh' -- Default shell for terminal commands
vim.o.shellcmdflag = '-c' -- Flag for executing shell commands
vim.o.shellpipe = '2>&1| tee' -- Pipe for shell output redirection
vim.o.shellredir = '>' -- Redirection operator for shell commands
vim.o.showmode = false -- Hide mode messages (like -- INSERT --)
vim.o.signcolumn = 'yes' -- Always show sign column
vim.o.swapfile = false -- Disable swap files
vim.o.tabstop = 4 -- Number of spaces a Tab counts for
vim.o.timeoutlen = 300 -- Time (ms) to wait for mapped sequence
vim.o.undofile = true -- Save undo history to a file
vim.o.updatetime = 250 -- Faster update time for CursorHold events and swap
vim.o.whichwrap = 'bs<>[]hl' -- Allow cursor keys to wrap to previous/next line
vim.o.wrap = false -- Do not wrap long lines; scroll horizontally
vim.o.writebackup = false -- Writing backup while editing
vim.g.have_nerd_font = true -- Flag that Nerd Font is available
vim.g.mapleader = ' ' -- Global leader key
vim.g.maplocalleader = ' ' -- Local leader key

vim.opt.formatoptions:append('r') -- Keep automatic comment continuation on Enter
vim.opt.formatoptions:remove({ 'c', 'o' }) -- Remove auto-wrap and auto comment on 'o'
vim.opt.iskeyword:append('-') -- Treat hyphenated words as part of a word
vim.opt.listchars = { -- Visualize tabs, trailing spaces, and non-breaking spaces
  tab = '» ',
  trail = '·',
  nbsp = '␣',
}
vim.opt.shortmess:append('c') -- Suppress ins-completion-menu messages
vim.opt.termguicolors = true -- Enable true-color support in the terminal
