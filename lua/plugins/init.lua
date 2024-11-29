local M = {
	{
    "nvim-lualine/lualine.nvim",
		enabled = false,
	},
  -- disable trouble
  {
    "folke/trouble.nvim",
    enabled = true,
    opts = { use_diagnostic_signs = true },
    -- config = function()
    --   dofile(vim.g.base46_cache .. "trouble")
    -- end,
  },
  {
    "LazyVim/LazyVim",
    version = "*",
    priority = 10000,
    lazy = false,
    cond = true,
    opts = {
      defaults = {
        autocmds = true, -- lazyvim.config.autocmds
        keymaps = false, -- lazyvim.config.keymaps
        -- lazyvim.config.options can't be configured here since that's loaded before lazyvim setup
        -- if you want to disable loading options, add `package.loaded["lazyvim.config.options"] = true` to the top of your init.lua
      },

			-- icons used by other plugins
			-- stylua: ignore
			colorscheme = "nvchad",
      icons = {
        misc = {
          dots = "󰇘",
          git = " ",
        },
        ft = {
          octo = "",
        },
        dap = {
          Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
          Breakpoint = " ",
          BreakpointCondition = " ",
          BreakpointRejected = { " ", "DiagnosticError" },
          LogPoint = ".>",
        },
        diagnostics = {
          Error = "✘", --   ✘
          Warn = "󰀪", --  󰀪 ▲󰳤 󱗓 
          Info = "ⁱ", --    󰋼 󰋽 ⚑ⁱ
          Hint = "", --  󰌶 
        },
        status = {
          git = {
            added = "₊", --  ₊
            modified = "∗", --  ∗
            removed = "₋", --  ₋
          },
          diagnostics = {
            error = " ",
            warn = " ",
            info = " ",
            hint = " ",
          },
          filename = {
            modified = "+",
            readonly = "🔒",
            zoomed = "🔎",
          },
        },
        -- Default completion kind symbols.
        kinds = {
          Array = "󰅪 ", --  󰅪 󰅨 󱃶
          Boolean = "󰨙 ", --  ◩ 󰔡 󱃙 󰟡 󰨙
          Class = "󰌗 ", --  󰌗 󰠱 𝓒
          Codeium = "󰘦 ", -- 󰘦
          Collapsed = " ", -- 
          Color = "󰏘 ", -- 󰸌 󰏘
          Constant = "󰏿 ", --   󰏿
          Constructor = " ", --  󰆧   
          Control = " ", -- 
          Copilot = " ", --  
          Enum = "󰕘 ", --  󰕘  ℰ 
          EnumMember = " ", --  
          Event = " ", --  
          Field = " ", --  󰄶  󰆨  󰀻 󰃒 
          File = " ", --    󰈔 󰈙
          Folder = " ", --   󰉋
          Function = "󰊕 ", --  󰊕 
          Interface = " ", --    
          Key = " ", -- 
          Keyword = " ", --   󰌋 
          Method = "󰊕 ", --  󰆧 󰊕 ƒ
          Module = " ", --   󰅩 󰆧 󰏗
          Namespace = "󰦮 ", -- 󰦮   󰅩
          Null = " ", --  󰟢
          Number = "󰎠 ", --  󰎠 
          Object = " ", --   󰅩
          Operator = "󰃬 ", --  󰃬 󰆕 +
          Package = " ", --   󰏖 󰏗 󰆧
          Property = " ", --   󰜢   󰖷
          Reference = "󰈝 ", --  󰈝 󰈇
          Snippet = " ", --  󰘌 ⮡   
          String = " ", --   󰅳
          Struct = "󰆼 ", -- 󰆼   𝓢 󰙅 󱏒
          TabNine = "󰏚 ", -- 󰏚
          Text = " ", --   󰉿 𝓐
          TypeParameter = " ", --  󰊄 𝙏
          Unit = " ", --   󰑭 
          Value = " ", --   󰀬 󰎠
          Variable = " ", --   󰀫 
        },
      },
    },
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
}

dofile(vim.g.base46_cache .. "git")

return M
