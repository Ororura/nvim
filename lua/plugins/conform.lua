return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      -- Добавляем поддержку swift_format, не трогая остальное
      opts.formatters_by_ft.swift = { "swift_format" }

      opts.formatters.swift_format = {
        command = "swift-format",
        args = { "--stdin", "--assume-filename", "$FILENAME" },
        stdin = true,
      }

      -- Если хочешь кастомный timeout или fallback:
      opts.format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = true,
      }
    end,
  },
}
