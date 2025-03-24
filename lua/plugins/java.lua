return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      -- prevent .settings, .project, etc files from being generated in the project folder
      table.insert(opts.cmd, "--jvm-arg=-Djava.import.generatesMetadataFilesAtProjectRoot=false")
    end,
  },
}
