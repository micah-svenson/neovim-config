return {
  "ahmedkhalf/project.nvim",
  patterns = { ".git", "Makefile", "pom.xml", "package.json", ".venv" },
  show_hidden = true,
  silent_chdir = false,
  detection_methods = { "lsp", "pattern" },
}
