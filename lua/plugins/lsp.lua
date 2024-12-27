return {
  { import = "plugins.extras.lsp.gtd" },

  { import = "lazyvim.plugins.extras.lsp.neoconf" },
  { import = "lazyvim.plugins.extras.lsp.none-ls" },

  { import = "lazyvim.plugins.extras.lang.docker" },
  { import = "lazyvim.plugins.extras.lang.yaml" },
  { import = "lazyvim.plugins.extras.lang.json" },
  { import = "lazyvim.plugins.extras.lang.toml" },

  -- Lang
  { import = "plugins.extras.lang.python", cond = ConfigVariable.lang.python },
  { import = "plugins.extras.lang.go", cond = ConfigVariable.lang.golang },
  { import = "plugins.extras.lang.typescript", cond = ConfigVariable.lang.typescript },
  { import = "plugins.extras.lang.markdown", cond = ConfigVariable.lang.markdown },
  { import = "plugins.extras.lang.java", cond = ConfigVariable.lang.java },
  { import = "plugins.extras.lang.c_cpp", cond = ConfigVariable.lang.cpp },
  { import = "plugins.extras.lang.scala", cond = ConfigVariable.lang.scala },
  { import = "plugins.extras.lang.kubernetes", cond = ConfigVariable.lang.kubernetes },
}
