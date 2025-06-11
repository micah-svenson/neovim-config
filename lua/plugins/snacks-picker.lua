return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[Neovim - Why work hard when you can Vim smart?]],
      },
    },
    picker = {
      formatters = {
        file = {
          -- number of results to return
          truncate = 300,
        },
      },
      sources = {
        grep = {
          -- Configure grep options here
          args = {
            "--hidden", -- Include hidden files
            -- "--no-ignore", -- Don't respect .gitignore files
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          -- If you want to exclude specific directories:
          exclude = { ".git", "node_modules" },
        },
      },
      win = {
        preview = {
          wo = {
            -- wrap text in the preview window
            wrap = true,
          },
        },
        list = {
          wo = {
            -- wrap text in the list results window
            wrap = true,
          },
        },
      },
    },
  },
}
