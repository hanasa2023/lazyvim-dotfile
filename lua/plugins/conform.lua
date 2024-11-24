return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    lsp_fallback = true,
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      vue = { "prettier" },
      python = { "ruff", "ruff_organize_imports" },
      markdown = { "prettier" },

      sh = { "shfmt" },
    },
  },
}
