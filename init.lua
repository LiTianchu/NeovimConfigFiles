-- Set mapleader before loading any plugins or settings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("misc.options") -- general settings
require("misc.keybinds") -- keybindings

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

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
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
				"nvim-tree/nvim-web-devicons",
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
			"ThePrimeagen/harpoon",
			branch = "harpoon2",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
		{
			"MeanderingProgrammer/render-markdown.nvim",
			dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
			---@module 'render-markdown'
			---@type render.md.UserConfig
			opts = {},
		},
		{ "windwp/nvim-ts-autotag" },
		{
			"HiPhish/rainbow-delimiters.nvim",
			dependencies = {
				"nvim-treesitter/nvim-treesitter",
			},
		},
		require("plugins.debuggerimport"),
		require("plugins.copilotimport"),
		require("plugins.lspimport"),
		require("plugins.agenticimport"),
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

require("themes.color")
local telescope_builtin = require("telescope.builtin")

require("telescope").setup({
	pickers = { find_files = { hidden = false } },
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
vim.keymap.set("n", "<leader>fd", telescope_builtin.diagnostics, {})
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, {})

require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"lua",
		"javascript",
		"typescript",
		"html",
		"css",
		"markdown",
		"c",
		"cpp",
		"c_sharp",
		"python",
		"rust",
		"json",
		"dockerfile",
		"graphql",
		"svelte",
		"java",
		"gdscript",
		"hlsl",
		"glsl",
		"toml",
		"yaml",
		"ocaml",
	},
	highlight = { enable = true },
	indent = { enable = true },
})

require("neo-tree").setup({
	-- options go here
	filesystem = {
		filtered_items = {
			visible = false,
			hide_dotfiles = true,
			hide_gitignored = true,
			hide_ignored = true, -- hide files that are ignored by other gitignore-like files
			-- other gitignore-like files, in descending order of precedence.
			ignore_files = {
				".neotreeignore",
				".ignore",
				-- ".rgignore"
			},
			hide_by_name = {
				"node_modules",
				".git",
			},
			hide_by_pattern = { -- uses glob style patterns
				"*.meta",
				"*/src/*/temp/*",
				-- godot specific patterns --
				"*.uid",
				"*.tscn",
				"*.tres",
				"*.import",
				-- end godot specific patterns --
				-- unity specific patterns --
				"*.unity",
				"*.asset",
				"*.prefab",
				-- end unity specific patterns --
			},
			never_show = { -- remains hidden even if "show hidden" is toggled on
				".DS_Store",
				"thumbs.db",
			},
			always_show = { -- remains visible even if other settings would normally hide it
				".gitignore",
				".gitattributes",
				".prettier*",
				".config",
				".vscode",
				".zed",
				".vs",
				".idea",
			},
			always_show_by_pattern = { -- uses glob style patterns
				".env*",
			},
		},
	},
	window = {
		-- position = "float",
		-- position = "left",
		position = "right",
		width = 32,
	},
})

local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>aa", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<leader>al", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<C-S-N>", function()
	harpoon:list():next()
end)

require("lualine").setup({
	options = { theme = "everforest" },
})

require("render-markdown").setup({})
require("plugins.copilotconfig")
require("plugins.lspconfig")

require("render-markdown").setup({})
require("nvim-ts-autotag").setup({
	opts = {
		-- Defaults
		enable_close = true, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = false, -- Auto close on trailing </
	},
	per_filetype = {
		["html"] = {
			enable_close = false,
		},
	},
})

-- Allow clipboard access in WSL
if vim.fn.has("wsl") == 1 then
	vim.g.clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = "clip.exe",
			["*"] = "clip.exe",
		},
		paste = {
			["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	}
end
