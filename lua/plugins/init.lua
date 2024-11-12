return {
	-- disable trouble
	{ "folke/trouble.nvim", enabled = true, opts = { use_diagnostic_signs = true } },
	{
		"LazyVim/LazyVim",
		version = "*",
		priority = 10000,
		lazy = false,
		cond = true,
		opts = {
			-- icons used by other plugins
			-- stylua: ignore
			-- colorscheme = "catppuccin-mocha",
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
}
