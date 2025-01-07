return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the inlay hints.
      inlay_hints = {
        enabled = true,
        exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
      },
      -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the code lenses.
      codelens = {
        enabled = true,
      },
    },
  },

  --------------------------------
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
