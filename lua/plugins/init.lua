return {
  "gpanders/editorconfig.nvim",

  "nvim-lua/plenary.nvim",

  {
    "nvim-lualine/lualine.nvim",
    enabled = false,
  },

  {
    "catppuccin/nvim",
    enabled = false,
  },

  "nvim-lua/plenary.nvim",

  {
    "nvchad/base46",
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  {
    "nvchad/ui",
    lazy = false,
    config = function()
      require("nvchad")
    end,
  },

  "nvzone/volt",
  "nvzone/menu",

  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  { "lifepillar/pgsql.vim", ft = "pgsql" },
  { "MTDL9/vim-log-highlighting", ft = "log" },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
}
