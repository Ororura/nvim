return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = { "github/copilot.vim" }, -- Требуется основной Copilot
    opts = {
      debug = false, -- Включить отладку при необходимости
    },
    keys = {
      { "<leader>cc", "<cmd>CopilotChat<cr>", desc = "Открыть Copilot Chat" },
      { "<leader>ce", "<cmd>CopilotChatExplain<cr>", desc = "Объяснить код" },
      { "<leader>cf", "<cmd>CopilotChatFix<cr>", desc = "Исправить код" },
      { "<leader>ct", "<cmd>CopilotChatTests<cr>", desc = "Сгенерировать тесты" },
    },
  },
}
