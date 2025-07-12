return {
  -- setup conform.nvim
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      python = { "ruff_format" },
    },
    lsp_fallback = true,
  },
}

