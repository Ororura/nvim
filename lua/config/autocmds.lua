local autocmd = vim.api.nvim_create_autocmd

-- Форматирование перед сохранением (JS, TS, JSON)
autocmd("BufWritePre", {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.json" },
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- Автофикс eslint при сохранении
autocmd("BufWritePre", {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- Форматирование через `conform` для JS/TS
autocmd("BufWritePre", {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
  callback = function()
    require("conform").format()
  end,
})

-- Форматирование перед сохранением (Go)
autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- Автосохранение при изменениях
autocmd({ "InsertLeave", "TextChanged", "TextChangedI" }, {
  pattern = "*",
  command = "silent! write",
})
