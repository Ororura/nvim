return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      -- Форматтеры для Swift
      opts.formatters_by_ft.swift = opts.formatters_by_ft.swift or {}
      table.insert(opts.formatters_by_ft.swift, "swift_format")

      opts.formatters.swift_format = {
        command = "swift-format",
        args = { "--stdin", "--assume-filename", "$FILENAME" },
        stdin = true,
      }

      -- Форматтеры для Prettier (JS, TS, HTML и т.д.)
      local prettier_filetypes = {
        "javascript",
        "typescript",
        "typescriptreact",
        "javascriptreact",
        "html",
        "css",
        "json",
        "markdown",
        "yaml",
      }

      for _, ft in ipairs(prettier_filetypes) do
        opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
        table.insert(opts.formatters_by_ft[ft], "prettier")
      end

      opts.formatters.prettier = {
        command = "prettier",
        args = { "--stdin-filepath", "$FILENAME" },
        stdin = true,
        cwd = require("conform.util").root_file({ ".prettierrc", "package.json", ".git" }),
      }
    end,
  },
}
