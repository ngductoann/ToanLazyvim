return {
	"abecodes/tabout.nvim",
	event = "InsertCharPre",
	-- event = 'VeryLazy',
	priority = 1000,
	config = function()
		-- tabout
		require("tabout").setup({
			tabouts = {
				{ open = "'", close = "'" },
				{ open = '"', close = '"' },
				{ open = "`", close = "`" },
				{ open = "(", close = ")" },
				{ open = "[", close = "]" },
				{ open = "{", close = "}" },
			},
			ignore_beginning = true,
		})
	end,
}
