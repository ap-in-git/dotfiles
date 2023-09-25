local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local default_plugins = {
{
  'kyazdani42/nvim-tree.lua',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('user/plugins/nvim-tree')
  end,
},
{
  'nvim-treesitter/nvim-treesitter',
  build = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  dependencies = {
    'nvim-treesitter/playground',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    require('user/plugins/treesitter')
  end,
},
{
    'nvim-telescope/telescope.nvim', tag = '0.1.3',

dependencies = { 'nvim-lua/plenary.nvim' ,{    
	      "nvim-telescope/telescope-live-grep-args.nvim" ,
        version = "^1.0.0"},
    config = function()
	    require('telescope').load_extensions('live_grep_args')
	    require('user/plugins/telescope')
    end,
}
    },
{
  'glepnir/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('user/plugins/dashboard-nvim')
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
},{
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
}}

require("lazy").setup(default_plugins)
