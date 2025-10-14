vim.g.mapleader = " "


-- Normal Mode
-- Cusor line
vim.opt.cursorline = true

-- No Wrap
vim.opt.wrap = false

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Line number
vim.opt.number = true

-- Allow copy pasting with system clipboard
vim.opt.clipboard:append("unnamedplus")

-- Enable mouse
vim.opt.mouse:append("a")

-- Case when searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Aesthetics
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- Tabs
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.shiftwidth = 4 -- indent width (4 spaces)
vim.opt.tabstop = 4 -- tab display width

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

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- add your plugins here
		--{ "catppuccin/nvim", name = "catppuccin", priority = 1000 }
		{
			"folke/tokyonight.nvim",
			lazy = false,
			priority = 1000,
			opts = {
				transparent = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
			},
		},
		{
			"3rd/image.nvim",
			build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
			opts = {
				processor = "magick_cli",
			},
		},
		-- init.lua:
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.8",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-treesitter/nvim-treesitter", branch = "master", lazy = false, build = ":TSUpdate" },
		{
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"MunifTanjim/nui.nvim",
				"nvim-tree/nvim-web-devicons", -- optional, but recommended
			},
			lazy = false, -- neo-tree will lazily load itself
		},
		{ "MunifTanjim/nui.nvim" },
		{ "nvim-lua/plenary.nvim" },
		{
			"nvim-lualine/lualine.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},
		{
			"zbirenbaum/copilot.lua",
			cmd = "Copilot",
			event = "InsertEnter",
		},
		{
			"CopilotC-Nvim/CopilotChat.nvim",
			branch = "main",
			dependencies = {
				{ "zbirenbaum/copilot.lua" },
				{ "nvim-lua/plenary.nvim" },
			},
			keys = {
				{ "<leader>cc", ":vertical rightbelow CopilotChatToggle<CR>", desc = "Toggle Copilot Chat" },
				{
					":vertical rightbelow CopilotChatExplain<CR>",
					mode = "v",
					desc = "Explain code",
				},
				{
					"<leader>cf",
					":vertical rightbelow CopilotChatFix<CR>",
					mode = "v",
					desc = "Fix code",
				},
				{
					"leader>co",
					":vertical rightbelow CopilotChatOptimize<CR>",
					mode = "v",
					desc = "Optimize code",
				},
				{ "<leader>c", ":vertical rightbelow CopilotChat", desc = "Open Copilot Chat" },
			},
		},
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
		{
			"neovim/nvim-lspconfig",
			lazy = false,
		},
		{
			"nvimtools/none-ls.nvim",
			dependencies = { "nvimtools/none-ls-extras.nvim" },
		},
		{
			"MeanderingProgrammer/render-markdown.nvim",
			-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
			-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
			dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
			---@module 'render-markdown'
			---@type render.md.UserConfig
			opts = {},
		},
		{
			"jay-babu/mason-null-ls.nvim",
			event = { "BufReadPre", "BufNewFile" },
			dependencies = {
				"williamboman/mason.nvim",
				"nvimtools/none-ls.nvim",
			},
		},
		require("plugins.completions"),
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local telescope_builtin = require("telescope.builtin")

require("telescope").setup({
	pickers = { find_files = { hidden = true } },
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

-- load telescope ui select extension
require("telescope").load_extension("ui-select")

vim.keymap.set("n", "<C-p>", telescope_builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, {})

require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "javascript" },
	highlight = { enable = true },
	indent = { enable = true },
})

require("neo-tree").setup({
	-- options go here
	filesystem = {
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
		},
	},
	window = {
		-- position = "float",
		-- position = "left",
		position = "right",
	},
})

require("lualine").setup({
	options = { theme = "everforest" },
})

require("copilot").setup({
	suggestion = {
		enabled = true,
		auto_trigger = true, -- false if want only manual
		keymap = {
			accept = "<C-l>",
		},
	},
	panel = { enabled = true },
})

require("CopilotChat").setup({
	window = {
		layout = "vertical",
		-- layout = 'float',
		width = 0.18,
		title = "Copilot",
	},
	headers = {
		user = "👤 You",
		assistant = "🤖 Copilot",
		tool = "🔧 Tool",
	},
})
require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls", -- Lua
		"ts_ls", -- Typescript
		"cssls", -- CSS
		"tailwindcss", -- Tailwind
		"html", -- HTML
		"omnisharp", -- C#
		"rust_analyzer", -- Rust
		"pyright", -- Python
		"clangd", -- C/C++
		"jdtls", -- Java
		"yamlls", -- YAML
		"jsonls", -- JSON
		"dockerls", -- Docker
		"sqlls", -- SQL
		"graphql", -- GraphQL
		"marksman", -- Markdown
		"eslint", -- ESLint
		"bashls", -- Bash
	},
})

require("mason-null-ls").setup({
	ensure_installed = {
		"stylua", -- Lua formatter
		"eslint_d", -- JS/TS linter
		"prettierd", -- JS/TS formatter
		"black", -- Python formatter
		"isort", -- Python import sorter
		"clang_format", -- C/C++ formatter
		"markdownlint", -- Markdown linter
		"sql_formatter", -- SQL formatter
		"yamlfmt", -- YAML formatter
		"csharpier", -- C# formatter
	},
})

-- LSP settings for various languages
-- Lua
-- vim.lsp.config("lua_ls", {
-- 	capabilities = capabilities,
-- })
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
})

vim.lsp.enable("lua_ls")

-- CSS
vim.lsp.config("cssls", {
    capabilities = capabilities,
})
vim.lsp.enable("cssls")

-- Tailwind CSS
vim.lsp.config("tailwindcss", {
    capabilities = capabilities,
})
vim.lsp.enable("tailwindcss", {})

-- TypeScript/JavaScript
vim.lsp.config("ts_ls", {
    capabilities = capabilities,
})
vim.lsp.enable("ts_ls", {})

-- Rust
vim.lsp.config("rust_analyzer", {
    capabilities = capabilities,
})
vim.lsp.enable("rust_analyzer")

-- C#
vim.lsp.config("omnisharp", {
    capabilities = capabilities,
})
vim.lsp.enable("omnisharp")

-- HTML
vim.lsp.config("html", {
    capabilities = capabilities,
})
vim.lsp.enable("html")

-- Python
vim.lsp.config("pyright", {
    capabilities = capabilities,
})
vim.lsp.enable("pyright")

-- C/C++
vim.lsp.config("clangd", {
    capabilities = capabilities,
})
vim.lsp.enable("clangd")

-- Java
vim.lsp.config("jdtls", {
    capabilities = capabilities,
})
vim.lsp.enable("jdtls")

-- YAML
vim.lsp.config("yamlls", {
    capabilities = capabilities,
})
vim.lsp.enable("yamlls")

-- JSON
vim.lsp.config("jsonls", {
    capabilities = capabilities,
})
vim.lsp.enable("jsonls")

-- Docker
vim.lsp.config("dockerls", {
    capabilities = capabilities,
})
vim.lsp.enable("dockerls")

-- SQL
vim.lsp.config("sqlls", {
    capabilities = capabilities,
})
vim.lsp.enable("sqlls")

-- GraphQL
vim.lsp.config("graphql", {
    capabilities = capabilities,
})
vim.lsp.enable("graphql")

-- Markdown
vim.lsp.config("marksman", {
    capabilities = capabilities,
})
vim.lsp.enable("marksman")

-- ESLint
vim.lsp.config("eslint", {
    capabilities = capabilities,
})
vim.lsp.enable("eslint")

-- Bash
vim.lsp.config("bashls", {
    capabilities = capabilities,
})
vim.lsp.enable("bashls")

-- Linter and Formatter settings
local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua, -- Lua formatter
		null_ls.builtins.completion.spell, -- spell checking
		require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
	},
})

require("render-markdown").setup({
	enable = false,
})

require("image").setup({
	backend = "kitty", -- or "ueberzug" or "sixel"
	processor = "magick_cli", -- or "magick_rock"
	integrations = {
		markdown = {
			enabled = true,
			filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
		},
	},
})

vim.cmd.colorscheme("tokyonight-storm")

-- line number color
vim.cmd("highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=#449ca6")
vim.cmd("highlight CursorLineNr term=bold cterm=NONE ctermfg=Yellow ctermbg=NONE gui=NONE guifg=Yellow guibg=#456b6b")

-- cursor line bg color
vim.cmd("highlight CursorLine guibg=#456b6b ctermbg=NONE")

-- commenting color
vim.cmd("highlight Comment guifg=#819696 ctermfg=DarkGrey gui=italic cterm=italic")

-- floating window bg color
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("highlight NormalFloat guibg=NONE ctermbg=NONE")
vim.cmd("highlight DiagnosticFloating guibg=NONE ctermbg=NONE")
vim.cmd("highlight FloatShadow guibg=#24283b ctermbg=NONE")

-- suggestion color
vim.cmd("highlight CopilotSuggestion guifg=#94b0a2 ctermfg=DarkGrey gui=italic cterm=italic")

-- Diagnostic config to have rounded border and padding
vim.diagnostic.config({
	float = {
		border = "rounded", -- or "single", "double", etc.
		focusable = true,
		source = "always",
		-- add empty lines to header/prefix for vertical/horizontal padding:
		header = "\n", -- for top padding
		prefix = "", -- for left padding
	},
})
