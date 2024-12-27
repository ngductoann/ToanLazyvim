return {

  -- Import LazyVim's formatting spec in its entirety.
  { import = "lazyvim.plugins.extras.formatting.prettier" },
  { import = "lazyvim.plugins.extras.formatting.black", cond = ConfigVariable.lang.python },
  { import = "lazyvim.plugins.extras.formatting.biome" },

  -- Lightweight yet powerful formatter plugin
  {
    "stevearc/conform.nvim",
		-- stylua: ignore
		keys = {
			{ '<leader>cic', '<cmd>ConformInfo<CR>', silent = true, desc = 'Conform Info' },
		},
    opts = {
      formatters = {
        ["google-java-format"] = {
          args = { "--aosp", "-" },
        },
      },
      formatters_by_ft = {
        java = { "google-java-format" },
      },
    },
  },
}
