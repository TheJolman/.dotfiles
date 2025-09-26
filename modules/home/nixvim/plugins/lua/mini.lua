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
  vim.fn.setret(vim.v.register, path)
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
vim.keymap.set({ 'n', 'x' }, '<Leader>gs', rhs, { desc = 'Show at cursor' })

local miniclue = require('mini.clue')
require('mini.clue').setup({
  clues = {
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  },
})
