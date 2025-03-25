local path = require("plenary.path")

-- Add goals to execute here
local mvn_goals = { "test", "verify", "compile", "package", "quarkus:dev" }

local function is_pom_xml_in_cwd()
  return path:new(vim.fn.getcwd() .. "/pom.xml"):exists()
end

local function find_dirs_with_pom_xml()
  local pomFiles = vim.fn.globpath(vim.fn.getcwd(), "**/pom.xml", false, true)

  local directories = {}
  for _, filePath in ipairs(pomFiles) do
    -- Extract the directory part of each file path
    local dir = vim.fn.fnamemodify(filePath, ":h")

    -- Exclude /src and /target
    if not string.find(dir, "/src") and not string.find(dir, "/target") then
      directories[dir] = true
    end
  end

  local dirList = vim.tbl_keys(directories)
  table.sort(dirList)
  return dirList
end

local function get_last_directory_in_path(dir)
  local path_with_trailing_slash = dir:gsub("([^/])$", "%1/")
  local last_directory = path_with_trailing_slash:match(".*/([^/]*)/$")
  return last_directory
end

local provider = {
  condition = {
    callback = is_pom_xml_in_cwd,
  },
  generator = function(opts, cb)
    local ret = {}
    local tasks = {}
    local pom_dirs = find_dirs_with_pom_xml()

    for _, dir in ipairs(pom_dirs) do
      local task = {}
      task.name = get_last_directory_in_path(dir)
      task.dir = string.sub(dir, string.len(vim.fn.getcwd()) + 1)
      task.goals = mvn_goals
      table.insert(tasks, task)
    end

    for i, task in ipairs(tasks) do
      table.insert(ret, {
        name = "maven - " .. task.name,
        params = {
          clean = {
            type = "boolean",
            desc = "Will apply clean goal before other goals",
            default = "true",
            order = 1,
          },
          skip_test = {
            type = "boolean",
            desc = "Skip tests?",
            default = false,
            order = 2,
          },
          goals = {
            type = "list",
            desc = "Select additional goal(s)",
            subtype = {
              type = "enum",
              choices = task.goals,
            },
            optional = true,
            delimiter = " ",
            order = 3,
          },
          extra_params = {
            type = "string",
            desc = "Add extra parameter like -Denable.integration.test",
            optional = true,
            order = 4,
          },
        },
        builder = function(params)
          local args = {}

          table.insert(args, "-f")
          table.insert(args, "." .. task.dir .. "/pom.xml")

          if params.clean then
            table.insert(args, "clean")
          end

          if params.goals then
            for _, goal in ipairs(params.goals) do
              table.insert(args, goal)
            end
          end

          if params.skip_test then
            table.insert(args, "-DskipTests=true")
          end

          local cmd = {}
          table.insert(cmd, "mvn")

          return {
            cmd = cmd,
            args = args,
            components = {
              {
                "open_output",
                open = true,
                direction = "dock",
                on_start = "always",
              },
              {
                "on_exit_set_status",
              },
            },
          }
        end,
        priority = i,
      })
    end

    cb(ret)
  end,
}

return provider
