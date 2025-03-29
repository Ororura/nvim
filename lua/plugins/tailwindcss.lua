return {
  {
    "luckasRanarison/tailwind-tools.nvim",
    ft = { "javascript", "typescript", "css", "html", "json", "yaml", "markdown", "javascriptreact", "typescriptreact" },
    config = function()
      require("tailwind-tools").setup()
    end,
  },
}
