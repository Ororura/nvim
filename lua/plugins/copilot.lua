return {
  {
    "github/copilot.vim",
    lazy = false, -- загружать сразу
    config = function()
      vim.g.copilot_no_tab_map = true -- отключаем стандартный Tab-аппинг
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
  },
}
