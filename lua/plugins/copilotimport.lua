return {
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
}
