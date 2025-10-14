-- View mode
-- Grab single or multiple lines
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv") -- Alt-j to more down
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv") -- Alt-k to more up

-- Neotree
vim.keymap.set("n", "<leader>nr", ":Neotree right reveal<CR>", { desc = "Reveal file in Neo-tree" })
vim.keymap.set("n", "<leader>nt", ":Neotree right toggle<CR>", { desc = "Toggle Neotree" })
vim.keymap.set("n", "<leader>nc", ":Neotree close<CR>", { desc = "Close Neotree" })
vim.keymap.set("n", "<leader>nb", ":Neotree right show buffers<CR>", { desc = "Show Neotree open buffers" })
vim.keymap.set("n", "<leader>ng", ":Neotree show git_status<CR>", { desc = "Show git status" })
vim.keymap.set("n", "<leader>nh", ":h Neo-tree<CR>", { desc = "Open help manual for Neo-tree" })
vim.keymap.set("n", "<leader>nf", ":Neotree float toggle<CR>", { desc = "Neo-tree (float)" })

vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader><F2>", vim.lsp.buf.rename, { desc = "LSP Rename" })
vim.keymap.set("n", "<F12>", vim.lsp.buf.references, { desc = "LSP References" })
vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, { desc = "LSP Format" })
vim.keymap.set("n", "fk", vim.diagnostic.open_float, { desc = "Show Diagnostics" })
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", { desc = "Go to left window" })
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", { desc = "Go to right window" })
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>", { desc = "Go to lower window" })
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>", { desc = "Go to upper window" })
vim.keymap.set("n", "<leader>f", ":wincmd w<CR>", { desc = "Go to next window" })
