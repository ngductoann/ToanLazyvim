return {
  { import = "plugins.extras.coding.lazydev" },
	-- { import = "lazyvim.plugins.extras.coding.nvim-cmp" },
	-- { import = "plugins.extras.coding.cmp" },

  { import = "lazyvim.plugins.extras.coding.luasnip" },
  { import = "lazyvim.plugins.extras.coding.neogen" },
  { import = "lazyvim.plugins.extras.coding.codeium", cond = ConfigVariable.ai.codeium },
  { import = "lazyvim.plugins.extras.coding.copilot", cond = ConfigVariable.ai.copilot },
  { import = "lazyvim.plugins.extras.coding.copilot-chat", cond = ConfigVariable.ai.copilot_chat },
}
