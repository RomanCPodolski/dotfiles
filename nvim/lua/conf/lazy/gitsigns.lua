return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("gitsigns").setup({
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "-" },
        changedelete = { text = "~" },
      },
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      watch_gitdir = { follow_files = true },
      current_line_blame = false,
      on_attach = function(bufnr)
        local gs = require("gitsigns")

        local function map(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = "git " .. desc })
        end

        map("n", "<leader>ghp", gs.preview_hunk, "preview hunk")
        map("n", "<leader>ghr", gs.reset_hunk, "reset hunk")
        map("n", "<leader>ghs", gs.stage_hunk, "stage hunk")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "unstage hunk")
        map("n", "<leader>ghd", gs.diffthis, "diff this")
        map("n", "<leader>ghbp", gs.preview_hunk_inline, "preview hunk inline")
        map("v", "<leader>ghs", function() gs.stage_hunk({vim.fn.line("."), vim.fn.line("v")}) end, "stage hunk")
        map("v", "<leader>ghu", function() gs.undo_stage_hunk({vim.fn.line("."), vim.fn.line("v")}) end, "unstage hunk")
        map("n", "<leader>ghS", gs.stage_buffer, "stage buffer")
        map("n", "<leader>ghu", gs.undo_stage_hunk, "unstage hunk")
        map("n", "<leader>ghR", gs.reset_buffer, "reset buffer")
        map("n", "<leader>ghB", function() gs.blame_line({ full = true }) end, "blame line full")
        map("n", "<leader>ghb", function() gs.blame_line() end, "blame line")
      end,
    })
  end,
}