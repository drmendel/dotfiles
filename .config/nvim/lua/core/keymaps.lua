vim.g.mapleader = ' ' -- Leader: space
vim.g.maplocalleader = ' ' -- Leader: space

local opts = { noremap = true, silent = true } -- Reoccuring options

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', opts) -- Exit from terminal mode
vim.keymap.set('n', 'x', '"_x', opts) -- Delete char without copy
vim.keymap.set('v', 'p', '"_dP', opts) -- Keep last yanked when pasting
vim.keymap.set('n', 'n', 'nzzzv', opts) -- Find and center
vim.keymap.set('n', 'N', 'Nzzzv', opts) -- Find and center
vim.keymap.set('v', '<', '<gv', opts) -- Indent left
vim.keymap.set('v', '>', '>gv', opts) -- Indent right

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', opts) -- Disable space in normal & visual mode
vim.keymap.set({ 'n', 'v' }, '<left>', '<cmd>echo "Use h!"<CR>') -- Disable left arrow in normal mode
vim.keymap.set({ 'n', 'v' }, '<right>', '<cmd>echo "Use l!"<CR>') -- Disable right arrow in normal mode
vim.keymap.set({ 'n', 'v' }, '<up>', '<cmd>echo "Use k!"<CR>') -- Disable up arrow in normal mode
vim.keymap.set({ 'n', 'v' }, '<down>', '<cmd>echo "Use j!"<CR>') -- Disable down arrow in normal mode

vim.keymap.set('n', '<A-j>', ':resize -2<CR>', opts) -- Resize splits with arrows
vim.keymap.set('n', '<A-k>', ':resize +2<CR>', opts) -- Resize splits with arrows
vim.keymap.set('n', '<A-h>', ':vertical resize -2<CR>', opts) -- Resize splits with arrows
vim.keymap.set('n', '<A-l>', ':vertical resize +2<CR>', opts) -- Resize splits with arrows

vim.keymap.set('n', '<C-s>', '<cmd>noautocmd w <CR>', opts) -- Save file without auto-formatting
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts) -- Vertical scroll and center
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts) -- Vertical scroll and center
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>', opts) -- Go down a split
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>', opts) -- Go up a split
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>', opts) -- Go left a split
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>', opts) -- Go right a split

vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts) -- Go to next buffer
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts) -- Go to prev buffer

vim.keymap.set('n', '<leader>wf', '<cmd>w<CR>', { desc = '[W]rite [F]ormat' })
vim.keymap.set('n', '<leader>ww', '<cmd>noautocmd w <CR>', { desc = '[W]rite [W]ithout Format' })

vim.keymap.set('n', '<leader>bx', ':bdelete!<CR>', { desc = '[B]uffer [X] (close)' })
vim.keymap.set('n', '<leader>bo', '<cmd> enew <CR>', { desc = '[B]uffer [O]pen' })

vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = '[S]plit [V]ertically' })
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = '[S]plit [H]orizontally' })
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = '[S]plit [E]qual' })
vim.keymap.set('n', '<leader>sx', ':close<CR>', { desc = '[S]plit [X] (close)' })

vim.keymap.set('n', '<leader>to', ':tabnew<CR>', { desc = '[T]ab [O]pen' })
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', { desc = '[T]ab [N]ext' })
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', { desc = '[T]ab [P]revious' })
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', { desc = '[T]ab [X] (close)' })

vim.keymap.set('n', '<leader>tt', '<cmd>lua tt()<CR>', { desc = '[T]erminal [T]oggle' })

vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', { desc = '[L]ine [W]rapping (toggle)' })

vim.keymap.set('n', '<leader>dp', function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = '[D]iagnostic [P]revious' })
vim.keymap.set('n', '<leader>dn', function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = '[D]iagnostic [N]ext' })
vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float, { desc = '[D]iagnostic [F]loating' })
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = '[D]iagnostic [L]ist' })
