return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      source_selector = {
        winbar = true,
      },
      window = {
        mappings = {
          ["<space>"] = "toggle_node",
          ["o"] = "open",
          ["S"] = "open_split",
          ["v"] = "open_vsplit",
          ["tt"] = "tele_to_browse",
          ["l"] = "focus_next_tab",
          ["h"] = "focus_prev_tab",
          ["P"] = "toggle_preview",
        },
      },
    })

    vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { silent = true, noremap = true })
    vim.keymap.set("n", "<leader>E", ":Neotree focus<CR>", { silent = true, noremap = true })
  end,
}