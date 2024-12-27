-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

if vim.F.if_nil(vim.g.elite_mode, false) then
  -- Elite-mode: Arrow-keys resize window
  map("n", "<Up>", "<cmd>resize +1<cr>", { desc = "Increase Window Height" })
  map("n", "<Down>", "<cmd>resize -1<cr>", { desc = "Decrease Window Height" })
  map("n", "<Left>", "<cmd>vertical resize +1<cr>", { desc = "Increase Window Width" })
  map("n", "<Right>", "<cmd>vertical resize -1<cr>", { desc = "Decrease Window Width" })
else
  -- Moves through display-lines, unless count is provided
  map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Down" })
  map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Up" })

  -- Resize window using <ctrl> arrow keys
  map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
  map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
  map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
  map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
end

map("n", "<C-t>", function()
  require("nvchad.themes").open()
end, {})

map("n", "<C-b>", function()
  require("base46").toggle_transparency()
end, {})

-- tabufline
map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map({ "n", "v" }, "<leader>cf", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })
