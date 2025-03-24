return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[Neovim - Why work hard when you can Vim smart?]],
      },
    },
    picker = {
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
