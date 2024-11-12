return {
	{ import = "plugins.extras.coding.cmp" },
	{ import = "plugins.extras.coding.lazydev" },
	{ import = "plugins.extras.coding.emmet" },
	{ import = "lazyvim.plugins.extras.coding.luasnip" },
	{ import = "plugins.extras.coding.nvim-autopairs" },
	{ import = "plugins.extras.coding.comment" },
	{ import = "plugins.extras.coding.inlay-hints" },
	{ import = "lazyvim.plugins.extras.coding.codeium", cond = ConfigVariable.ai.codeium },
	{ import = "lazyvim.plugins.extras.coding.copilot", cond = ConfigVariable.ai.copilot },
	{ import = "lazyvim.plugins.extras.coding.copilot-chat", cond = ConfigVariable.ai.copilot_chat },
}
