return {
  -----------------------------------------------------------------------------
  -- Completion plugin for neovim written in Lua
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    main = "lazyvim.util.cmp",
    dependencies = {
      -- nvim-cmp source for neovim builtin LSP client
      "hrsh7th/cmp-nvim-lsp",
      -- nvim-cmp source for buffer words
      "hrsh7th/cmp-buffer",
      -- nvim-cmp source for path
      "hrsh7th/cmp-path",
      -- nvim-cmp source for emoji
      "hrsh7th/cmp-emoji",
    },
    opts = function()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      local auto_select = true

      local cmp_next = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif require("luasnip").expand_or_jumpable() then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
        else
          fallback()
        end
      end

      local cmp_prev = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif require("luasnip").jumpable(-1) then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
        else
          fallback()
        end
      end

      return {
        window = {
          completion = cmp.config.window.bordered({
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
          }),
          documentation = cmp.config.window.bordered({
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
          }),
        },
        completion = {
          completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
        },
        preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
        view = {
          entries = { follow_cursor = true },
        },
        sorting = defaults.sorting,
        experimental = {
          ghost_text = false,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp", priority = 50 },
          { name = "path", priority = 40 },
        }, {
          { name = "buffer", priority = 50, keyword_length = 3 },
          { name = "emoji", insert = true, priority = 20 },
        }),
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-d>"] = cmp.mapping.select_next_item({ count = 5 }),
          ["<C-u>"] = cmp.mapping.select_prev_item({ count = 5 }),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-n>"] = cmp_next,
          ["<C-p>"] = cmp_prev,
        }),
        formatting = {
          format = function(entry, item)
            local icons = LazyVim.config.icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end

            local widths = {
              abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
              menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
            }

            for key, width in pairs(widths) do
              if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
                item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
              end
            end

            return item
          end,
        },
      }
    end,
  },
}
