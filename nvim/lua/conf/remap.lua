vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlights text when yanking",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit window" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up center" })

vim.keymap.set("n", "n", "nzz", { desc = "Next search center" })
vim.keymap.set("n", "N", "Nzz", { desc = "Prev search center" })

vim.keymap.set("n", "<C-w>s", "<C-w>s", { desc = "Split horizontal" })
vim.keymap.set("n", "<C-w>v", "<C-w>v", { desc = "Split vertical" })
