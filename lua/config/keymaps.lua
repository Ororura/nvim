-- ~/.config/nvim/lua/config/keymaps.lua
vim.g.mapleader = " "
local map = vim.keymap.set
map("n", "<leader>e", ":NvimTreeToggle<CR>")
map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>fg", ":Telescope live_grep<CR>")

map("n", "<C-h>", "<C-w>h", { desc = "Фокус влево" })
map("n", "<C-l>", "<C-w>l", { desc = "Фокус вправо" })
map("n", "<C-k>", "<C-w>k", { desc = "Фокус вверх" })
map("n", "<C-j>", "<C-w>j", { desc = "Фокус вниз" })


map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic' })
map('n', 'gd', vim.lsp.buf.definition, { desc = 'Перейти к определению' })
map('n', 'di', vim.lsp.buf.implementation, { desc = 'Перейти к имплементации' })
map('n', 'gr', vim.lsp.buf.references, { desc = 'Показать все использования' })
map('n', 'K', vim.lsp.buf.hover, { desc = 'Показать документацию' })


vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format({ async = true }) end)


-- Normal mode: Ctrl + S → :w
map("n", "<C-s>", ":w<CR>", { desc = "Сохранить файл", silent = true })

-- Insert mode: Ctrl + S → сохранить и остаться во вставке
map("i", "<C-s>", "<Esc>:w<CR>gi", { desc = "Сохранить файл", silent = true })

map("n", "<leader>qq", function()
  -- закрыть nvim-tree, если открыт
  local api_ok, nvim_tree = pcall(require, "nvim-tree.api")
  if api_ok then
    nvim_tree.tree.close()
  end

  -- сохранить все и выйти
  vim.cmd("qa")
end, { desc = "Закрыть всё (включая nvim-tree)" })

vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', ':bprev<CR>', { desc = 'Previous buffer' })

-- Быстрое закрытие буфера
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>bD', ':bd!<CR>', { desc = 'Force close buffer' })

for i = 1, 9 do
  vim.keymap.set('n', '<leader>' .. i, ':b' .. i .. '<CR>', { desc = 'Buffer ' .. i })
end
