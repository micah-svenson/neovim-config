return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = "basic",
                diagnosticMode = "workspace",
                inlayHints = {
                  variableTypes = true,
                  functionReturnTypes = true,
                },
              },
              -- point to virtual environment
              pythonPath = vim.fn.getcwd() .. "/.venv/bin/python",
            },
          },
        },
      },
    },
  },
}
