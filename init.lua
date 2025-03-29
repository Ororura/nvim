-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Настройка кодировки
vim.opt.encoding = "utf-8"
vim.g.neovide_input_macos_alt_is_meta = true
-- Настройка горячих клавиш для перехода к определению
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true }) -- 'gd' для перехода к определению

-- Навигация по буферам с использованием <A-h> и <A-l>
vim.keymap.set("n", "<A-h>", ":bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-l>", ":bnext<CR>", { noremap = true, silent = true })

-- Переход к первому и последнему буферу
vim.keymap.set("n", "<A-1>", ":bfirst<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-9>", ":blast<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.json" },
  callback = function()
    vim.lsp.buf.format()
  end,
})

vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostics" })
vim.keymap.set("n", "gk", vim.lsp.buf.references, { noremap = true, silent = true })
-- Закрытие буфера
vim.keymap.set("n", "<A-w>", ":bd<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
  callback = function()
    require("conform").format()
  end,
})

-- Код-экшены (LSP actions)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format()
  end,
})

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "TextChangedI" }, {
  pattern = "*",
  command = "silent! write",
})

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Actions" })
