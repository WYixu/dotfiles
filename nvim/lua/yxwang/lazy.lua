-- Bootstrap lazy.nvim
local vim = vim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  return
end

-- Start setup
lazy.setup({
  -- main color scheme
  {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
  },

  { 'tanvirtin/monokai.nvim', },

  -- Icons
  { 'nvim-tree/nvim-web-devicons', lazy = true },

  -- Git labels
  {
    'lewis6991/gitsigns.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('gitsigns').setup()
    end
  },

  -- Git integrations
  {
    'tpope/vim-fugitive',
    -- config = function ()
      -- require('fugitive').setup()
    -- end
  },

  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },

  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

  -- Coc
  {
    'neoclide/coc.nvim',
    branch = "release",
  },

  -- neorg
  {
    'nvim-neorg/neorg',
    build = ':Neorg sync-parsers',
    dependencies = 'nvim-lua/plenary.nvim'
  },
})
