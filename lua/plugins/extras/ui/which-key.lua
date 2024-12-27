return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  cmd = "WhichKey",
  opts_extend = { "spec" },
		-- stylua: ignore
		opts = {
			defaults = {},
			icons = {
				breadcrumb = '»',
				separator = '󰁔  ', -- ➜
			},
			delay = function(ctx)
				return ctx.plugin and 0 or 400
			end,
			spec = {
				{
					{
						"<leader>j",
						group = "Hop",
						mode = { "n", "v" },
						{ "<leader>jj", "<cmd>HopWord<cr>",      desc = "Hop word" },
						{ "<leader>jl", "<cmd>HopLine<cr>",      desc = "Hop line" },
						{ "<leader>jc", "<cmd>HopChar1<cr>",     desc = "Hop char" },
						{ "<leader>jp", "<cmd>HopPattern<cr>",   desc = "Hop arbitrary" },
						{ "<leader>ja", "<cmd>HopAnywhere<cr>",  desc = "Hop all" },
						{ "<leader>js", "<cmd>HopLineStart<cr>", desc = "Hop line start" },
					},
					{ "<leader>r",  group = "Run",                nowait = true,        remap = false },
					{ "<leader>rf", "<cmd>RunFile<CR>",           desc = "Run File",    nowait = true, remap = false },
					{ "<leader>rp", "<cmd>RunProject<CR>",        desc = "Run Project", nowait = true, remap = false },
					{ "<leader>rr", "<cmd>RunCode<CR>",           desc = "Run Code",    nowait = true, remap = false },
				},
			},
		},
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    if not vim.tbl_isempty(opts.defaults) then
      LazyVim.warn("which-key: opts.defaults is deprecated. Please use opts.spec instead.")
      wk.add(opts.defaults)
    end
  end,
}
