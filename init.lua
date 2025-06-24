require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.lsp")
require("config.treesitter")
require("config.cmp")

--[[ require("nvim-tree").setup({
  actions = {
    open_file = {
      quit_on_open = false,  -- Не закрывать дерево при открытии файла
      window_picker = {
        enable = true,
      },
    },
    change_dir = {
      enable = true,
      global = false,
    },
  },
  on_attach = function(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- Переназначаем 'l' на открытие файла или разворот папки
    vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
    -- Можно добавить 'h' для закрытия папки
    vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
  end,
})

vim.diagnostic.config({
  virtual_text = true,  -- Показывать inline (в строке)
  signs = true,         -- Показывать значки сбоку
  underline = true,     -- Подчёркивание проблемных мест
  update_in_insert = false,
  severity_sort = true,
})
--]]
vim.cmd("colorscheme gruvbox")

vim.g.netrw_liststyle = 3

vim.opt.list = true
vim.opt.listchars = { tab = '→ ' }  -- или '--', '>-', '▸ ', и т. д.
