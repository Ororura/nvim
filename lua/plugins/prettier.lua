return {
  {
    "prettier/vim-prettier",
    ft = {
      "javascript",
      "javascriptreact", -- JSX
      "typescript",
      "typescriptreact", -- TSX
      "css",
      "html",
      "json",
      "yaml",
      "markdown",
    },
    config = function()
      vim.cmd([[
        let g:prettier#autoformat = 1
        let g:prettier#autoformat_require_pragma = 0
      ]])
    end,
  },
}
