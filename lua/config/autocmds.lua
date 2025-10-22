-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Chezmoi template filetype detection
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.*.tmpl",
  callback = function()
    local filename = vim.fn.expand("%:t")
    -- Extract the base filetype from the filename (e.g., "sh" from "script.sh.tmpl")
    local base_ft = filename:match("%.([^%.]+)%.tmpl$")
    if base_ft then
      -- Set the filetype to the base type with .tmpl suffix for potential ftplugin files
      vim.bo.filetype = base_ft .. ".tmpl"
      -- Also set syntax to the base filetype for basic syntax highlighting
      vim.bo.syntax = base_ft
    end
  end,
})

-- NOTE: This crashed out pretty bad when spotless wasn't there. might want to try and find something more elegant.
-- Use built-in spotless formatter for java files
--
-- Format java files with mvn spotless. jdtls config has formatting turned off. See plugins/java.lua.
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--   pattern = "*.java",
--   callback = function()
--     local filepath = vim.api.nvim_get_current_buf()
--     local project_pom = "-f " .. vim.fn.getcwd() .. "pom.xml"
--     local status, err =
--       pcall(os.execute, "mvn spotless:apply " .. project_pom .. " -DspotlessFiles=" .. filepath .. " > /dev/null 2>&1")
--     if status then
--       vim.cmd.edit()
--     else
--       print("Failed to run spotless: " .. err)
--     end
--   end,
-- })
