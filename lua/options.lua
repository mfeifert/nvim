vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true  -- Turn tabs into spaces
vim.o.linebreak = true  -- Wrap lines between words
vim.o.smartindent = true
vim.o.termguicolors = true
vim.o.showmode = false
vim.o.background = 'dark'

vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>s', ':write<CR>')
vim.keymap.set('n', '<leader>tl', ':set background=light<CR>')
vim.keymap.set('n', '<leader>td', ':set background=dark<CR>')
vim.keymap.set('n', '<leader>w', ':set wrap!<CR>')
vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>')

vim.keymap.set('n', '<C-j>', ':wincmd W<CR>')
vim.keymap.set('n', '<C-k>', ':wincmd w<CR>')
vim.keymap.set('n', '<C-c>', ':wincmd c<CR>')
