local conform = require("conform")
local autocmd = vim.api.nvim_create_autocmd

-- Форматирование conform при сохранении для JS, TS, JSON
autocmd("BufWritePre", {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.json" },
  callback = function()
    conform.format()
  end,
})

-- Форматирование Go через conform (если gofmt/goimports подключен)
autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    conform.format()
  end,
})

-- Автосохранение при выходе из Insert и на изменения
autocmd({ "InsertLeave", "TextChanged", "TextChangedI" }, {
  pattern = "*",
  callback = function()
    if vim.bo.modified and vim.bo.filetype ~= "gitcommit" then
      vim.cmd("silent! write")
    end
  end,
})
