return {
  "MysticalDevil/inlay-hints.nvim",
  dependencies = {
    {
      "felpafel/inlay-hint.nvim",
      config = function()
        require("inlay-hint").setup({
          virt_text_pos = "inline",
        })
      end,
    },
  },
  config = function()
    require("inlay-hints").setup()
  end,
  event = "LspAttach",
}
