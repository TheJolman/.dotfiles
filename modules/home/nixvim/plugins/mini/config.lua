local minifiles = require('mini.files')
local set_cwd = function()
  local path = (minifiles.get_fs_entry() or {}).path
  if path == nil then
    return vim.notify('Cursor is not on valid entry')
  end
  vim.fn.chdir(vim.fs.dirname(path))
end

local yank_path = function()
  local path = (minifiles.get_fs_entry() or {}).path
  if path == nil then
    return vim.notify('Cursor is not on valid entry')
  end
  vim.fn.setreg(vim.v.register, path)
end

vim.api.nvim_create_autocmd('User', {
  pattern = 'MiniFilesBufferCreate',
  callback = function(args)
    local b = args.data.buf_id
    vim.keymap.set('n', 'g~', set_cwd, { buffer = b, desc = 'Set cwd' })
    vim.keymap.set('n', 'gy', yank_path, { buffer = b, desc = 'Yank path' })
  end,
})

local rhs = '<CMD>lua MiniGit.show_at_cursor()<CR>'
vim.keymap.set({ 'n', 'x' }, '<leader>gs', rhs, { desc = 'Show at cursor' })

local miniclue = require('mini.clue')
require('mini.clue').setup({
  triggers = {
    -- Leader triggers
    { mode = { 'n', 'x' }, keys = '<Leader>' },
    -- `[` and `]` keys
    { mode = 'n', keys = '[' },
    { mode = 'n', keys = ']' },
    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },
    -- `g` key
    { mode = { 'n', 'x' }, keys = 'g' },
    { mode = { 'n', 'x' }, keys = 'gc' },
    -- Marks
    { mode = { 'n', 'x' }, keys = "'" },
    { mode = { 'n', 'x' }, keys = '`' },
    -- Registers
    { mode = { 'n', 'x' }, keys = '"' },
    { mode = { 'i', 'c' }, keys = '<C-r>' },
    -- Window commands
    { mode = 'n', keys = '<C-w>' },
    -- `z` key
    { mode = { 'n', 'x' }, keys = 'z' },
  },
  clues = {
    miniclue.gen_clues.square_brackets(),
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },
})

local sessions = require('mini.sessions')

local function save_session(name)
  name = name or vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
  sessions.write(name)
  vim.notify("Session '" .. name .. "' written", vim.log.levels.INFO)
end

vim.api.nvim_create_user_command('SSave', function(opts)
  save_session(opts.args ~= '' and opts.args or nil)
end, { nargs = '?', complete = 'file' })

vim.api.nvim_create_user_command('SPick', function()
  sessions.select()
end, {})
