return {
	"folke/lazydev.nvim",
	ft = "lua",
	cmd = "LazyDev",
	dependencies = {
		-- {
		-- 	"hrsh7th/nvim-cmp",
		-- 	opts = function(_, opts)
		-- 		table.insert(opts.sources, { name = "lazydev", group_index = 0 })
		-- 	end,
		-- },
	},
	opts = {
		library = {
			{ path = "luvit-meta/library", words = { "vim%.uv" } },
			{ path = "LazyVim", words = { "LazyVim" } },
			{ path = "lazy.nvim", words = { "LazyVim" } },
		},
	},
}
