local map = vim.keymap.set

local opts = { noremap = true, silent = true }

-- Переход к определению
map("n", "gd", vim.lsp.buf.definition, opts)

-- Навигация по буферам
map("n", "<A-h>", ":bprevious<CR>", opts)
map("n", "<A-l>", ":bnext<CR>", opts)
map("n", "<A-1>", ":bfirst<CR>", opts)
map("n", "<A-9>", ":blast<CR>", opts)

-- Диагностика
map("n", "gl", vim.diagnostic.open_float, { desc = "Show diagnostics" })
map("n", "gk", vim.lsp.buf.references, { noremap = true, silent = true, desc = "Show references" })

map("n", "<leader>f", vim.lsp.buf.format, {})

-- Закрытие буфера
map("n", "<A-w>", ":bp <BAR> bd #<CR>", opts)

-- LSP Code Actions
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Actions" })
