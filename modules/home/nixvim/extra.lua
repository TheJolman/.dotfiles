-- Use // as default commentstring instead of /* */
-- vim.api.nvim_create_autocmd({ 'FileType' }, {
--   pattern = { 'c', 'cpp', 'javascript', 'typescript', 'java', 'rust', 'go' },
--   callback = function()
--     vim.bo.commentstring = '// %s'
--   end,
-- })

-- Refresh buffer on focus gain
vim.api.nvim_create_autocmd({ 'FocusGained', 'BufEnter' }, {
  pattern = '*',
  command = 'checktime',
})

-- Spellcheck in markdown files
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'text' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.textwidth = 80
    vim.opt_local.spell = true
  end,
})

-- Tabs
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'go', -- Go fmt
    'gomod', -- Go modules
    'gosum', -- Go checksum
    'gotmpl', -- Go templates
    'make', -- Makefiles require tabs
  },
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.softtabstop = 4
  end,
})

-- Expanding functionality of :make
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'cpp', 'c' },
  callback = function()
    if vim.fn.filereadable('CMakeLists.txt') == 1 then
      vim.opt.makeprg = 'cmake --build build'
    end
  end,
})
