return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	enabled = not vim.g.started_by_firenvim,
	keys = {
		{ "<leader>bc", "<Cmd>BufferLinePick<CR>", desc = "Tab Pick" },
	},
	opts = {
		options = {
			indicator = {
				icon = "▎", -- this should be omitted if indicator style is not 'icon'
				style = "icon", -- 'icon' | 'underline' | 'none',
			},
			buffer_close_icon = "󰅖",
			modified_icon = "● ",
			close_icon = " ",
			left_trunc_marker = " ",
			right_trunc_marker = " ",
			show_buffer_icons = true, -- disable filetype icons for buffers
			show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
			separator_style = "thick",
			show_close_icon = true,
			show_buffer_close_icons = true,
			diagnostics = "nvim_lsp",
			show_tab_indicators = true,
			enforce_regular_tabs = true,
			always_show_bufferline = true,
			close_command = function(n)
				Snacks.bufdelete(n)
			end,
			right_mouse_command = function(n)
				Snacks.bufdelete(n)
			end,
			diagnostics_indicator = function(_, _, diag)
				local icons = LazyVim.config.icons.diagnostics
				local ret = (diag.error and icons.Error .. " " .. diag.error .. " " or "")
					.. (diag.warning and icons.Warn .. " " .. diag.warning or "")
				return vim.trim(ret)
			end,
			custom_areas = {
				right = function()
					local result = {}
					local root = LazyVim.root()
					table.insert(result, {
						text = "%#BufferLineTab# " .. vim.fn.fnamemodify(root, ":t"),
					})

					-- Session indicator
					if vim.v.this_session ~= "" then
						table.insert(result, { text = "%#BufferLineTab#  " })
					end
					return result
				end,
			},
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					text_align = "center",
				},
			},
			---@param opts bufferline.IconFetcherOpts
			get_element_icon = function(opts)
				return LazyVim.config.icons.ft[opts.filetype]
			end,
		},
	},
	config = function(_, opts)
		require("bufferline").setup(opts)
		-- Fix bufferline when restoring a session
		vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
			callback = function()
				vim.schedule(function()
					---@diagnostic disable-next-line: undefined-global
					pcall(nvim_bufferline)
				end)
			end,
		})
	end,
}
