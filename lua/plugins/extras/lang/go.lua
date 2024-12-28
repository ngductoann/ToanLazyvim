return {
  { import = "lazyvim.plugins.extras.lang.go" },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "json-to-struct",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "go", "gowork", "gomod", "gosum", "json" },
      })
    end,
  },
}
