return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black", "isort" },
        java = { "google-java-format" },
        rust = { "rustfmt" },
        yaml = { "prettier" },
        json = { "prettier" },
        dockerfile = { "hadolint" },
        bash = { "shfmt" },
        vim = { "vim-script-formatter" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
    })

    vim.keymap.set("n", "<leader>cf", function()
      conform.format({ lsp_fallback = true })
    end, { desc = "Format file" })
  end,
}