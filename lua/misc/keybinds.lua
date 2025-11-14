-- Grab single or multiple lines
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv") -- Alt-j to more down
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv") -- Alt-k to more up

-- Neotree
vim.keymap.set("n", "<leader>nt", ":Neotree right toggle reveal<CR>", { desc = "Toggle Neotree" })
vim.keymap.set("n", "<leader>nb", ":Neotree right show buffers<CR>", { desc = "Show Neotree open buffers" })
vim.keymap.set("n", "<leader>ng", ":Neotree show git_status<CR>", { desc = "Show git status" })
vim.keymap.set("n", "<leader>nh", ":h Neo-tree<CR>", { desc = "Open help manual for Neo-tree" })
vim.keymap.set("n", "<leader>nf", ":Neotree float toggle reveal<CR>", { desc = "Neo-tree (float)" })

-- LSP Navigation
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "gl", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to Type Definition" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
vim.keymap.set(
	"n",
	"gdx",
	":belowright split | lua vim.lsp.buf.definition()<CR>",
	{ desc = "Go to Definition (Horizontal Split)" }
)
vim.keymap.set("n", "gdv", ":vsplit | lua vim.lsp.buf.definition()<CR>", { desc = "Go to Definition (Vertical Split)" })
vim.keymap.set("n", "gdt", ":tab split | lua vim.lsp.buf.definition()<CR>", { desc = "Go to Definition (New Tab)" })

-- LSP Code Actions and Refactoring
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader><F2>", vim.lsp.buf.rename, { desc = "LSP Rename" })
vim.keymap.set("n", "<F12>", vim.lsp.buf.references, { desc = "LSP References" })
vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, { desc = "LSP Format" })
vim.keymap.set("n", "fk", vim.diagnostic.open_float, { desc = "Show Diagnostics" })

-- Window navigation (Leader + h/j/k/l)
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>", { desc = "Go to left window" })
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>", { desc = "Go to right window" })
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>", { desc = "Go to lower window" })
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>", { desc = "Go to upper window" })
vim.keymap.set("n", "<leader>f", ":wincmd w<CR>", { desc = "Go to next window" })

-- Resize windows (Ctrl + Arrow Keys)
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Split windows (Alt + h / v)
vim.keymap.set("n", "<A-h>", ":split<CR>", { desc = "Horizontal Split" })
vim.keymap.set("n", "<A-v>", ":vsplit<CR>", { desc = "Vertical Split" })
