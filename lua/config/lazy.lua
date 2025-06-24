-- ~/.config/nvim/lua/config/lazy.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- список плагинов:
  "nvim-lua/plenary.nvim",

  -- UI
  "nvim-tree/nvim-web-devicons",
  "nvim-lualine/lualine.nvim",
  "nvim-telescope/telescope.nvim",
	"ellisonleao/gruvbox.nvim" ,
{'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },

  -- LSP + автодополнение
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",

  -- Автоформаттеры
  "jose-elias-alvarez/null-ls.nvim",

  -- nvim-tree
  "nvim-tree/nvim-tree.lua",
{
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({})
  end,
}
})
