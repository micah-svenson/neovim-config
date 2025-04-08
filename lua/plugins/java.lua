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
}
