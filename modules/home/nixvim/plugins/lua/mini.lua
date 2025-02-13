local set_cwd = function()
  local path = (MiniFiles.get_fs_entry() or {}).path
  if path == nil then
    return vim.notify('Cursor is not on valid entry')
  end
  vim.fn.chdir(vim.fs.dirname(path))
end

local yank_path = function()
  local path = (MiniFiles.get_fs_entry() or {}).path
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
