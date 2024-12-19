-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

if jit.os == "OSX" then
  vim.keymap.set({ "n", "v" }, "<D-c>", '"+y', { desc = "Copy to system clipboard" }) -- cmd+c to copy to system clipboard
  vim.keymap.set({ "n", "v" }, "<D-v>", '"+p', { desc = "Paste from system clipboard" }) -- cmd+v to paste from system clipboard
  vim.keymap.set({ "i", "c" }, "<D-v>", "<C-R>+", { desc = "Paste from system clipboard" }) -- cmd+v to paste in insert mode
else
  vim.keymap.set({ "n", "v" }, "<C-c>", '"+y', { desc = "Copy to system clipboard" }) -- cmd+c to copy to system clipboard
  vim.keymap.set({ "n", "v" }, "<C-v>", '"+p', { desc = "Paste from system clipboard" }) -- cmd+v to paste from system clipboard
  vim.keymap.set({ "i", "c" }, "<C-v>", "<C-R>+", { desc = "Paste from system clipboard" }) -- cmd+v to paste in insert mode
end

vim.keymap.set("n", "<C-h>", "<cmd>KittyNavigateLeft<cr>", { desc = "Go to Left Window" })
vim.keymap.set("n", "<C-j>", "<cmd>KittyNavigateDown<cr>", { desc = "Go to Lower Window" })
vim.keymap.set("n", "<C-k>", "<cmd>KittyNavigateUp<cr>", { desc = "Go to Upper Window" })
vim.keymap.set("n", "<C-l>", "<cmd>KittyNavigateRight<cr>", { desc = "Go to Right Window" })

vim.keymap.del("n", "<leader>n")
vim.keymap.del("n", "<leader>un")
vim.keymap.del("n", "<leader>.")
vim.keymap.del("n", "<leader>S")
vim.keymap.del("n", "<leader>dps")
