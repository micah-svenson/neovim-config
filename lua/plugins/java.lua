return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      -- prevent .settings, .project, etc files from being generated in the project folder
      table.insert(opts.cmd, "--jvm-arg=-Djava.import.generatesMetadataFilesAtProjectRoot=false")
      table.insert(opts.cmd, "-Xmx8G")

      opts.settings = {
        java = {
          format = {
            -- using autocmd + spotless mvn plugin. see autocmds.lua
            enabled = true,
            -- allow java commments to be formatted?
            comments = { enabled = false },
            -- insertSpaces = true,
            -- onType = {enabled = false},
            -- settings = {
            --   profile = "ha",
            --   url = "ha",
            -- },
            tabSize = 4,
          },
        },
      }
    end,
  },
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      servers = {
        lemminx = {
          init_options = {
            settings = {
              xml = {
                format = {
                  enabled = true,
                  splitAttributes = "preserve",
                  maxLineWidth = 280,
                },
              },
              xslt = {
                format = {
                  enabled = true,
                  splitAttributes = "preserve",
                  maxLineWidth = 280,
                },
              },
            },
          },
        },
      },
    },
  },

  -- NOTE: Commented out code below is a failed attempt to get debuggable tests working through neotest.
  -- In the future mabye look into https://github.com/nvim-java/nvim-java instead
  -- Or this https://github.com/bcampolo/nvim-starter-kit/blob/java/.config/nvim/ftplugin/java.lua
  -- {
  --   "rcasia/neotest-java",
  --   ft = "java",
  --   dependencies = {
  --     "mfussenegger/nvim-jdtls",
  --     "mfussenegger/nvim-dap", -- for the debugger
  --     "rcarriga/nvim-dap-ui", -- recommended
  --     "theHamsta/nvim-dap-virtual-text", -- recommended
  --   },
  --   init = function()
  --     -- override the default keymaps.
  --     -- needed until neotest-java is integrated in LazyVim
  --     local keys = require("lazyvim.plugins.lsp.keymaps").get()
  --     -- run test file
  --     -- keys[#keys + 1] = {
  --     --   "<leader>tt",
  --     --   function()
  --     --     require("neotest").run.run(vim.fn.expand("%"))
  --     --   end,
  --     --   mode = "n",
  --     -- }
  --     -- -- run nearest test
  --     -- keys[#keys + 1] = {
  --     --   "<leader>tr",
  --     --   function()
  --     --     require("neotest").run.run()
  --     --   end,
  --     --   mode = "n",
  --     -- }
  --     -- debug test file
  --     keys[#keys + 1] = {
  --       "<leader>tD",
  --       function()
  --         require("neotest").run.run({ strategy = "dap" })
  --       end,
  --       mode = "n",
  --     }
  --     -- debug nearest test
  --     keys[#keys + 1] = {
  --       "<leader>td",
  --       function()
  --         require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
  --       end,
  --       mode = "n",
  --     }
  --   end,
  -- },
  -- {
  --   "nvim-neotest/neotest",
  --   dependencies = {
  --     "nvim-neotest/nvim-nio",
  --     "nvim-lua/plenary.nvim",
  --     "antoinemadec/FixCursorHold.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   opts = {
  --     adapters = {
  --       ["neotest-java"] = {
  --         -- config here
  --       },
  --     },
  --   },
  -- },
  -- {
  --   "willothy/flatten.nvim",
  --   opts = {
  --     nest_if_no_args = true,
  --   }, -- Ensure that it runs first to minimize delay when opening file from terminal
  --   lazy = false,
  --   priority = 11001,
  --   -- FIXME: [neotest hangs when running Go tests #106](https://github.com/willothy/flatten.nvim/issues/106)
  --   cond = false,
  -- },
}
