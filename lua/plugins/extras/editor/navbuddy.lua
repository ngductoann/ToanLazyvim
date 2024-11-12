return {
  {
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      lsp = { auto_attach = true },
      -- window = { sections = { right = { preview = 'always' } } },
      window = {
        border = "rounded",
        position = { row = 1, col = "100%" },
        size = { width = "70%", height = "30%" },
        sections = {
          left = {
            size = "33%",
            border = nil,
          },
          mid = {
            size = "33%",
            border = nil,
          },
          right = {
            border = nil,
            preview = "leaf",
          },
        },
      },
      mappings = {
        -- structured like this to avoid having to `require('nvim-navbuddy')` during startup
        ["/"] = {
          callback = function(display)
            local nvim_navbuddy_telescope = require("nvim-navbuddy.actions").telescope({
              layout_strategy = "horizontal",
              layout_config = {
                height = 0.60,
                width = 0.60,
                preview_width = 0.50,
              },
            })
            return nvim_navbuddy_telescope.callback(display)
          end,
          description = "Fuzzy search current level with telescope",
        },
      },
    },
    keys = {
      {
        "<leader>cb",
        function()
          require("nvim-navbuddy").open()
        end,
        desc = "Jump to symbol",
      },
    },
  },
  {
    "SmiteshP/nvim-navic",
    lazy = false,
    init = function()
      vim.g.navic_silence = true
      LazyVim.lsp.on_attach(function(client, buffer)
        if client.supports_method("textDocument/documentSymbol") then
          require("nvim-navic").attach(client, buffer)
        end
      end)
    end,
  },
}
