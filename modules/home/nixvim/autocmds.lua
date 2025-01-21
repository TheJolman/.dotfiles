vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "c", "cpp", "javascript", "typescript", "java", "rust", "go" },
  callback = function()
    vim.bo.commentstring = "// %s"
  end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  pattern = "*",
  command = "checktime"
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "python",              -- PEP 8
    "rust",                -- Official style guide
    "java",                -- Common convention
    "scala",               -- Scala style guide
    "php",                 -- PSR-2
    "lua",                 -- Common in Neovim community
    "swift",               -- Swift API guidelines
    "haskell",             -- Common convention
    "elixir",              -- Common convention
    "terraform",           -- HashiCorp style
    "markdown",            -- Common for nested lists
  },
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end
})

-- 2 spaces
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "javascript",           -- Standard JS
    "typescript",           -- Common with TS
    "javascriptreact",
    "typescriptreact",
    "vue",            -- Vue style guide
    "json",           -- Common convention
    "html",           -- Common convention
    "css",            -- Common convention
    "scss",
    "sass",
    "yaml",            -- YAML spec
    "ruby",            -- Ruby style guide
    "eruby",           -- Embedded Ruby
    "cpp",             -- Google style guide
    "c",               -- Google style guide
    "cmake",           -- Common convention
    "toml",            -- Common convention
    "xml",             -- Common convention
    "dart",            -- Dart style guide
    "nim",             -- Common convention
  },
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
  end
})

-- Tabs
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "go",               -- Go fmt
    "gomod",            -- Go modules
    "gosum",            -- Go checksum
    "gotmpl",           -- Go templates
    "make",             -- Makefiles require tabs
  },
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.shiftwidth = 4
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end
})

-- Special cases
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "gdscript",           -- Godot's style (3 spaces)
  },
  callback = function()
    vim.opt_local.expandtab = true
    vim.opt_local.shiftwidth = 3
    vim.opt_local.tabstop = 3
    vim.opt_local.softtabstop = 3
  end
})
