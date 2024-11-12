return {
	{ import = "lazyvim.plugins.extras.lang.java" },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
				"google-java-format"
      },
    },
  },
}
