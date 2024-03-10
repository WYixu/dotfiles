--[[
--Auto commands config file
--]]
local vim = vim

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local map = vim.keymap.set
local function iabbrev(l, r)
  vim.cmd{cmd = 'iabbrev', args = {l, r}}
end

augroup('FileTypeCpp', { clear = true })
autocmd('FileType', {
  pattern = 'cpp',
  group = 'FileTypeCpp',
  callback = function()
    map('n', '<localleader>c', 'I//<esc>', { buffer = 0 })
  end,
})

augroup('FileTypeHaskell', { clear = true })
autocmd('FileType', {
  pattern = 'haskell',
  group = 'FileTypeHaskell',
  callback = function()
    iabbrev('WALL', '{-# OPTIONS_GHC -Wall #-}')
  end,
})

augroup('FileTypeNorg', { clear = true })
autocmd('FileType', {
  pattern = 'norg',
  group = 'FileTypeNorg',
  callback = function()
    vim.opt_local.conceallevel = 2
    vim.opt_local.textwidth = 79
  end,
})

augroup('FileTypeTex', { clear = true })
autocmd('FileType', {
  pattern = 'tex',
  group = 'FileTypeTex',
  callback = function()
    vim.opt_local.textwidth = 79
  end,
})
-- autocmd('BufWritePre', {
  -- pattern = '*.tex',
  -- group = 'FileTypeNorg',
  -- command = "normal gggqG",
-- })
