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

-- require("CopilotChat").setup({
--     model = "claude-sonnet-4.5",
-- 	window = {
-- 		layout = "vertical",
-- 		-- layout = 'float',
-- 		width = 0.3,
-- 		title = "Copilot",
-- 	},
-- 	headers = {
-- 		user = "👤 You",
-- 		assistant = "🤖 Copilot",
-- 		tool = "🔧 Tool",
-- 	},
-- })
