-- после загрузки в lazy
require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "javascript", "typescript", "tsx", "html", "css", "lua", "json"
  },
  highlight = { enable = true },
  indent = { enable = true },
}
