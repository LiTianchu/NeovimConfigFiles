vim.g.mapleader = " "

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

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- add your plugins here
		-- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
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
		-- {
		-- 	"3rd/image.nvim",
		-- 	build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
		-- 	opts = {
		-- 		processor = "magick_cli",
		-- 	},
		-- },
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
			"ThePrimeagen/harpoon",
			branch = "harpoon2",
			dependencies = { "nvim-lua/plenary.nvim" },
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
		{ "windwp/nvim-ts-autotag" },
		require("plugins.copilotimport"),
		require("plugins.lspimport"),
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
	},
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
        width = 32,
	},
})

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

require("lualine").setup({
	options = { theme = "everforest" },
})

require("render-markdown").setup({
})
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
	-- Also override individual filetype configs, these take priority.
	-- Empty by default, useful if one of the "opts" global settings
	-- doesn't work well in a specific filetype
	per_filetype = {
		["html"] = {
			enable_close = false,
		},
	},
})
-- require("image").setup({
-- 	backend = "kitty", -- or "ueberzug" or "sixel"
-- 	processor = "magick_cli", -- or "magick_rock"
-- 	integrations = {
-- 		markdown = {
-- 			enabled = true,
-- 			filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
-- 		},
-- 	},
-- })


-- In init.lua
if vim.fn.has('wsl') == 1 then
  vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
      ['+'] = 'clip.exe',
      ['*'] = 'clip.exe',
    },
    paste = {
      ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end

