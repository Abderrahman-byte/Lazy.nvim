local map = LazyVim.safe_keymap_set

map("x", "<leader>p", '"_dP')
map("x", "<leader>d", '"_d')
map("n", "<leader>d", '"_d')
map("n", "Q", "<nop>")

map("n", "<leader>k", "<CMD>bnext<CR>", { desc = "buffer goto next" })

map("n", "<leader>j", "<CMD>bprevious<CR>", { desc = "buffer goto prev" })

map("n", "<leader>bc", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer" })

map({ "n", "v" }, "<leader>fm", function()
  LazyVim.format({ force = true })
end, { desc = "Format" })

-- Remove newbie crutches in Normal Mode
map("n", "<Down>", "<Nop>", { noremap = true, silent = true })
map("n", "<Left>", "<Nop>", { noremap = true, silent = true })
map("n", "<Right>", "<Nop>", { noremap = true, silent = true })
map("n", "<Up>", "<Nop>", { noremap = true, silent = true })

-- Remove newbie crutches in Visual Mode
map("v", "<Down>", "<Nop>", { noremap = true, silent = true })
map("v", "<Left>", "<Nop>", { noremap = true, silent = true })
map("v", "<Right>", "<Nop>", { noremap = true, silent = true })
map("v", "<Up>", "<Nop>", { noremap = true, silent = true })

-- toggle DBUI
map("n", "<leader>du", "<cmd>DBUIToggle<CR>", { desc = "DBUI toggle window" })

-- esc twice to exit terminal
map("t", "<esc><esc>", "<c-\\><c-n>")
