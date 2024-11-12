LazyVim.on_very_lazy(function()
	vim.filetype.add({
		extension = { mdx = 'markdown.mdx' },
	})
end)

return {
	desc = 'Markdown lang extras, without headlines plugin, and toc generator.',
	recommended = function()
		return LazyVim.extras.wants({
			ft = { 'markdown', 'markdown.mdx' },
			root = 'README.md',
		})
	end,

	{ import = 'lazyvim.plugins.extras.lang.markdown' },

	-----------------------------------------------------------------------------
	-- Generate table of contents for Markdown files
	{
		'mzlogin/vim-markdown-toc',
		cmd = { 'GenTocGFM', 'GenTocRedcarpet', 'GenTocGitLab', 'UpdateToc' },
		ft = 'markdown',
		init = function()
			vim.g.vmt_auto_update_on_save = 0
		end,
	},

  {
    "lukas-reineke/headlines.nvim",
    opts = function()
      local opts = {}
      for _, ft in ipairs({ "markdown", "norg", "rmd", "org" }) do
        opts[ft] = {
          headline_highlights = {},
          -- Disable bullets for now.
          -- See https://github.com/lukas-reineke/headlines.nvim/issues/66
          bullets = {},
        }
        for i = 1, 6 do
          local hl = "Headline" .. i
          vim.api.nvim_set_hl(0, hl, { link = "Headline", default = true })
          table.insert(opts[ft].headline_highlights, hl)
        end
      end
      return opts
    end,
    ft = { "markdown", "norg", "rmd", "org" },
    config = function(_, opts)
      -- PERF: schedule to prevent headlines slowing down opening a file
      vim.schedule(function()
        require("headlines").setup(opts)
        require("headlines").refresh()
      end)
    end,
  },
}
