return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup({
        -- A list of parser names, or "all" (the listed parsers MUST always be installed)
        ensure_installed = { "sql" },

        sync_install = false,
        auto_install = true,

        ignore_install = {},
      })
    end,
  },
}
