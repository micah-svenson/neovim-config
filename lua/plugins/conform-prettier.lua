return {
  "stevearc/conform.nvim",
  opts = function(_, opts)
    -- Configure formatters
    opts.formatters = opts.formatters or {}

    -- Create a markdown-specific prettier formatter with pymdownx-compatible settings
    opts.formatters.prettier_markdown = {
      command = "prettier",
      args = {
        "--stdin-filepath",
        "$FILENAME",
        "--tab-width=4", -- 4 spaces for pymdownx list indentation
        "--prose-wrap=preserve", -- Don't rewrap text
        "--print-width=120", -- Allow longer lines
      },
      stdin = true,
    }

    -- Use the markdown-specific prettier for markdown files
    opts.formatters_by_ft = opts.formatters_by_ft or {}
    opts.formatters_by_ft.markdown = { "prettier_markdown" }
  end,
}
