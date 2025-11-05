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
			{
				"<leader>cc",
				":CopilotChatToggle<CR>",
				desc = "Toggle Copilot Chat",
			},
			{
				"<leader>ce",
				function()
					require("CopilotChat").ask("Explain how this code works.", {
						selection = require("CopilotChat.select").visual,
					})
				end,
				mode = "v",
				desc = "Explain code",
			},
			{
				"<leader>cf",
				function()
					require("CopilotChat").ask("Fix this code.", {
						selection = require("CopilotChat.select").visual,
					})
				end,
				mode = "v",
				desc = "Fix code",
			},
			{
				"<leader>co",
				function()
					require("CopilotChat").ask("Optimize this code.", {
						selection = require("CopilotChat.select").visual,
					})
				end,
				mode = "v",
				desc = "Optimize code",
			},
			{
				"<leader>c",
				":CopilotChat<CR>",
				desc = "Open Copilot Chat",
			},
            {
                "<leader>cm",
                ":CopilotChatModels<CR>",
                desc = "List Copilot Chat Models",
            },
		},
	},
}
