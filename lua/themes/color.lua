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

vim.o.winborder = "rounded"
