return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vscode").setup({
        style = "dark", -- или "light"
        transparent = false,
        italic_comments = true,
      })
    end,
  },

  { "rose-pine/neovim", name = "rose-pine" },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vscode").setup({
        style = "light", -- или "light"
        transparent = false,
        italic_comments = true,
      })
    end,
  },

  { "shaunsingh/nord.nvim" },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
