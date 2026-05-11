local m = {}

m.keys = {
	{
		"<c-\\>",
		function()
			require("agentic").toggle()
		end,
		mode = { "n", "v", "i" },
		desc = "toggle agentic chat",
	},
	{
		"<leader>ac",
		function()
			require("agentic").add_selection_or_file_to_context()
		end,
		mode = { "n", "v" },
		desc = "add file or selection to context",
	},
	{
		"<leader>ns",
		function()
			require("agentic").new_session()
		end,
		mode = { "n", "v", "i" },
		desc = "new agentic session",
	},
	{
		"<leader>rs",
		function()
			require("agentic").restore_session()
		end,
		mode = { "n", "v", "i" },
		desc = "agentic: restore session",
		silent = true,
	},
	{
		"<leader>ad",
		function()
			require("agentic").add_current_line_diagnostics()
		end,
		mode = { "n" },
		desc = "add current line diagnostics",
	},
	{
		"<leader>ab",
		function()
			require("agentic").add_buffer_diagnostics()
		end,
		mode = { "n" },
		desc = "add all buffer diagnostics",
	},
}

-- Any ACP-compatible provider works. Built-in: "claude-agent-acp" | "gemini-acp" | "codex-acp" | "opencode-acp" | "cursor-acp" | "copilot-acp" | "auggie-acp" | "mistral-vibe-acp" | "cline-acp" | "goose-acp"
m.opts = {
	provider = "copilot-acp",
}

return {
	"carlos-algms/agentic.nvim",
	keys = m.keys,
	opts = m.opts,
}
