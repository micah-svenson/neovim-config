return {
  {
    "sindrets/diffview.nvim",
    keys = {
      {
        "<leader>gvd",
        function()
          -- Diff between current working tree and develop
          require("diffview").open({ "origin/develop...HEAD", "--imply-local" })
        end,
        desc = "View Diff of Develop vs. Working Tree",
      },
      {
        "<leader>gvx",
        function()
          -- Diff between current working tree and develop
          require("diffview").close()
        end,
        desc = "Close current Diffview",
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        -- add group description to whichkey
        {
          "<leader>gv",
          group = "Diffview",
        },
      },
    },
  },
}
