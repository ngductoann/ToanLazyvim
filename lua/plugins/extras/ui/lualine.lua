local function is_file_window()
  return vim.bo.buftype == ""
end

local function is_not_prompt()
  return vim.bo.buftype ~= "prompt"
end

local function is_min_width(min)
  if vim.o.laststatus > 2 then
    return vim.o.columns > min
  end
  return vim.fn.winwidth(0) > min
end

local function filemedia(opts)
  opts = vim.tbl_extend("force", {
    separator = "  ",
  }, opts or {})
  return function()
    local parts = {}
    if vim.bo.fileformat ~= "" and vim.bo.fileformat ~= "unix" then
      table.insert(parts, vim.bo.fileformat)
    end
    if vim.bo.fileencoding ~= "" and vim.bo.fileencoding ~= "utf-8" then
      table.insert(parts, vim.bo.fileencoding)
    end
    if vim.bo.filetype ~= "" then
      table.insert(parts, vim.bo.filetype)
    end
    return table.concat(parts, opts.separator)
  end
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    -- PERF: we don't need this lualine require madness 🤷
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    local icons = LazyVim.config.icons

    vim.o.laststatus = vim.g.lualine_laststatus

    local colors = {
      blue = "#80a0ff",
      cyan = "#79dac8",
      black = "#080808",
      white = "#c6c6c6",
      red = "#ff5189",
      violet = "#d183e8",
      grey = "#303030",
    }

    local bubbles_theme = {
      normal = {
        a = { fg = colors.black, bg = colors.violet },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white },
      },

      insert = { a = { fg = colors.black, bg = colors.blue } },
      visual = { a = { fg = colors.black, bg = colors.cyan } },
      replace = { a = { fg = colors.black, bg = colors.red } },

      inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white },
      },
    }

    local opts = {
      options = {
        theme = bubbles_theme,
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = {
          statusline = { "dashboard", "alpha", "ministarter", "neo-tree", "Outline", "trouble" },
          winbar = { "neo-tree", "Outline", "trouble" },
        },
        -- component_separators = "",
        -- section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        -- component_separators = { left = "|", right = "|" },
        -- section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            right_padding = 2,
          },
        },
        lualine_b = {
          -- "filename", "branch",
          {
            "branch",
            cond = is_file_window,
            icon = "", --  
            padding = 1,
            on_click = function()
              vim.cmd([[Telescope git_branches]])
            end,
          },
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { LazyVim.lualine.pretty_path() },
        },
        lualine_c = {
          "%=", --[[ add your center compoentnts here in place of this comment ]]
        },
        lualine_x = {
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = function() return LazyVim.ui.fg("Statement") end,
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = function() return LazyVim.ui.fg("Constant") end,
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = function() return LazyVim.ui.fg("Debug") end,
          },
          -- stylua: ignore
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = function() return LazyVim.ui.fg("Special") end,
          },
        },
        lualine_y = {
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error .. " ",
              warn = icons.diagnostics.Warn .. " ",
              info = icons.diagnostics.Info .. " ",
              hint = icons.diagnostics.Hint .. " ",
            },
          },
          {
            filemedia(),
            padding = 1,
            cond = function()
              return is_min_width(70)
            end,
            on_click = function()
              vim.cmd([[Telescope filetypes]])
            end,
          },
        },
        lualine_z = {
          {
            function()
              if is_file_window() then
                return "%l/%2c%4p%%"
              end
              return "%l/%L"
            end,
            cond = is_not_prompt,
            padding = 2,
            -- separator = { right = "" },
          },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      winbar = {
        lualine_a = {},
        lualine_c = {},
      },
      tabline = {},
      extensions = { "neo-tree", "lazy" },
    }

    -- do not add trouble symbols if aerial is enabled
    -- And allow it to be overriden for some buffer types (see autocmds)
    if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
      local trouble = require("trouble")
      local symbols = trouble.statusline({
        mode = "symbols",
        groups = {},
        title = false,
        filter = { range = true },
        format = "{kind_icon}{symbol.name:Normal}",
        hl_group = "lualine_c_normal",
      })
      table.insert(opts.sections.lualine_c, {
        symbols and symbols.get,
        cond = function()
          return vim.b.trouble_lualine ~= false and symbols.has()
        end,
      })
    end

    if ConfigVariable.editor.navic then
      table.insert(opts.winbar.lualine_c, {
        "filename",
        -- color = colors.violet,
      })
      table.insert(opts.winbar.lualine_c, { "navic", color_correction = "dynamic" })
    end

    return opts
  end,
}
