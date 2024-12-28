return {
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "sql", "comment", "gotmpl", "regex", "jsonc" },
      })
    end,
  },
}
