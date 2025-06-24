-- ~/.config/nvim/lua/config/lsp.lua
local lspconfig = require("lspconfig")

local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.ts_ls.setup {
  capabilities = capabilities,
}

lspconfig.html.setup {
  capabilities = capabilities,
}

lspconfig.cssls.setup {
  capabilities = capabilities,
}

lspconfig.lua_ls.setup {
  capabilities = capabilities,
}

lspconfig.gopls.setup {
  capabilities = capabilities,
}
