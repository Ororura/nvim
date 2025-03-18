local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },

    {
      "Mofiqul/vscode.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        require("vscode").setup({
          style = "dark", -- или "light"
          transparent = false,
          italic_comments = true,
        })
        vim.cmd("colorscheme vscode")
      end,
    },

    -- LSP configuration
    {
      "neovim/nvim-lspconfig", -- LSP plugin for Neovim
      config = function()
        local lspconfig = require("lspconfig")

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
      end,
    },
  },

  defaults = {
    lazy = false,
    version = false, -- always use the latest git commit
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- Автофикс eslint при сохранении
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
  callback = function()
    vim.lsp.buf.format()
  end,
})
