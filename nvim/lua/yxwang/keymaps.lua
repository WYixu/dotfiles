local vim = vim
-- Basic Mappings
vim.g.mapleader = ','
vim.g.maplocalleader = '\\'

local map = vim.keymap.set

-- jk as esc
map('i', 'jk', '<esc>')
-- never use <esc> in insert mode
map('i', '<esc>', '')
-- quick edit init.lua
map('n', '<leader>ev', ':vsplit $MYVIMRC<cr>')
-- faster moving
map('n', 'H', '^')
map('n', 'L', '$')
map('n', 'J', '5jzz')
map('n', 'K', '5kzz')
-- recover joint
map('n', '<leader>j', 'J')
-- moving lines
map('n', '<leader>-', 'ddp')
map('n', '<leader>_', 'ddkp')
-- duplicate current line
map('n', '<leader>d', 'yyp')
-- uppercase
map('n', '<leader>u', 'viwU')
map('i', '<leader>u', '<esc>viwUwa')
-- add quotes, brackets
map('n', "<leader>'", "viw<esc>a'<esc>bi'<esc>lel")
map('n', '<leader>`', 'viw<esc>a`<esc>bi`<esc>lel')
map('n', '<leader>"', 'viw<esc>a"<esc>bi"<esc>lel')
map('n', '<leader>(', 'viw<esc>a)<esc>bi(<esc>lel')
map('n', '<leader>[', 'viw<esc>a]<esc>bi[<esc>lel')
map('n', '<leader>{', 'viw<esc>a}<esc>bi{<esc>lel')
map('v', "<leader>'", "<esc>a'<esc>`<i'<esc>f'")
map('v', '<leader>`', '<esc>a`<esc>`<i`<esc>f`')
map('v', '<leader>"', '<esc>a"<esc>`<i"<esc>f"')
map('v', '<leader>(', '<esc>a)<esc>`<i(<esc>f)')
map('v', '<leader>[', '<esc>a}<esc>`<i[<esc>f]')
map('v', '<leader>{', '<esc>a}<esc>`<i{<esc>f}')
-- open previous buffer
map('n', '<leader>p', ':execute "leftabove vsplit ".bufname("#")<cr>')
-- highlight trailing whitespace
map('n', '<leader>w', ':match Error /\\v\\s+$/<cr>')
map('n', '<leader>W', ':match Error //<cr>')
-- stop highlight
map('n', '<leader>/', ':nohlsearch<cr>')
-- always very magic mode
map('n', '/', '/\\v')
-- quick cnext and cprevious
map('n', '<leader>n', ':cnext<cr>')
map('n', '<leader>N', ':cprevious<cr>')
-- open Neorg index
map('n', '<leader>oi', ':Neorg index<cr>')
