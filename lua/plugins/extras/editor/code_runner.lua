return {
  "CRAG666/code_runner.nvim",
  cmd = { "RunCode", "RunFile", "RunProject" },
  config = function()
    local coderunner = require("code_runner")

    coderunner.setup({
      filetype = {
        -- java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
        -- cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
        java = "cd $dir && javac $fileName && java $fileNameWithoutExt && rm $fileNameWithoutExt.class",
        python = "python3 -u",
        typescript = "deno run",
        javascript = "node $dir/$fileName",
        dart = "dart $fileName",
        rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
        cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && rm $fileNameWithoutExt",
        c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && rm $fileNameWithoutExt",
        scss = "sass $dir/$fileName $dir/$fileNameWithoutExt.css",
        lua = "cd $dir && lua $fileName",
      },
      mode = "float", -- "float", "term", "tab"
      focus = true,
      startinsert = true,
      term = {
        -- position = "vert",
        position = "bot",
        size = 10,
      },
      float = {
        -- Key that close the code_runner floating window
        close_key = "<ESC>",
        -- Window border (see ':h nvim_open_win')
        -- border = "solid",
        border = "rounded",

        -- Num from `0 - 1` for measurements
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5,

        -- Highlight group for floating window/border (see ':h winhl')
        border_hl = "FloatBorder",
        float_hl = "Normal",

        -- Transparency (see ':h winblend')
        blend = 0,
      },
      project_path = vim.fn.expand("~/.config/nvim/project_manager.json"),
    })
  end,
}
