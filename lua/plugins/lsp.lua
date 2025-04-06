return {
  {
    "neovim/nvim-lspconfig", -- LSP plugin for Neovim
    config = function()
      local lspconfig = require("lspconfig")

      -- Swift setup
      lspconfig.sourcekit.setup({
        cmd = { "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp" },
        filetypes = { "swift", "objective-c", "objective-cpp" },
        root_dir = lspconfig.util.root_pattern("Package.swift", ".git"),
      })

      -- Go LSP server configuration (gopls)
      lspconfig.gopls.setup({
        cmd = { "gopls" },
        filetypes = { "go", "gomod" },
        root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
          },
        },
      })

      -- TypeScript/JavaScript LSP server configuration (tsserver)
      lspconfig.tsserver.setup({
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
        root_dir = lspconfig.util.root_pattern("tsconfig.json", "package.json", ".git"),
        settings = {
          typescript = {
            enable = true,
          },
          javascript = {
            enable = true,
          },
        },
      })

      -- ESLint LSP
      lspconfig.eslint.setup({
        cmd = { "vscode-eslint-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.js", ".eslintrc.json", "package.json"),
        settings = {
          format = true,
          workingDirectories = { mode = "auto" },
        },
      })

      -- C/C++ LSP server configuration (clangd)
      lspconfig.clangd.setup({
        cmd = { "clangd" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_dir = lspconfig.util.root_pattern(".clangd", "compile_commands.json", "compile_flags.txt", ".git"),
        settings = {},
      })
    end,
  },
}
