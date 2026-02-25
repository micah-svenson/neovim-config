return {
  {
    "nvim-mini/mini.snippets",
    opts = function(_, opts)
      local snippets = require("mini.snippets")
      local config_path = vim.fn.stdpath("config")

      opts.snippets = {
        -- Global snippets available in all filetypes
        snippets.gen_loader.from_file(config_path .. "/snippets/global.json"),
        -- Language-specific snippets (from friendly-snippets + snippets/{lang}.json)
        snippets.gen_loader.from_lang(),
      }
    end,
  },
}
