-- Chezmoi template support with Go template syntax highlighting
return {
  -- Add TreeSitter parsers for Go templates and related languages
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Ensure opts.ensure_installed exists
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "go", -- Go language parser
          "gomod", -- Go module parser
          "gotmpl", -- Go template parser (this is the key one for {{ }} syntax)
          "toml", -- For .toml.tmpl files
        })
      end
    end,
  },
}
