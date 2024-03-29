local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- General
map('n', '<leader>q', '<CMD>q<CR>')
map('n', '<leader>w', '<CMD>w<CR>')
map('n', '<leader>wq', '<CMD>wq<CR>', {silent = true})


-- Neotree
map('n', '<leader>e', '<CMD>Neotree toggle<CR>', {silent = true})
map('n', '<leader>b', '<CMD>Neotree buffers toggle<CR>', {silent = true})

-- For Buffers
-- map('n', '<leader>l', '<CMD>ls<CR>', {silent = true})
map('n', '<leader>p', '<CMD>bp<CR>', {silent = true})
map('n', '<leader>n', '<CMD>bn<CR>', {silent = true})
map('n', '<leader>d', '<CMD>bd<CR>', {silent = true})

-- For Windows
map('n', '<leader>h', '<C-W>h')
map('n', '<leader>l', '<C-W>l')
map('n', '<leader>j', '<C-W>j')
map('n', '<leader>k', '<C-W>k')
-- For resizing windows
map('n', '<leader>+', '<C-W>+', {silent = true})
map('n', '<leader>-', '<C-W>-', {silent = true})
map('n', '<leader>.', '<C-W>=', {silent = true})
map('n', '<leader>,', '<C-W><', {silent = true})



-- Telescope
map('n', '<leader>ff', '<CMD>Telescope find_files<CR>', {silent = true})
map('n', '<leader>fb', '<CMD>Telescope buffers<CR>', {silent = true})
map('n', '<leader>fh', '<CMD>Telescope help_tags<CR>', {silent = true})

-- ToggleTerm
-- map('n', '<M-t>', '<CMD>ToggleTerm<CR>', {silent = true})

-- Oil
map('n', '-', '<CMD>Oil<CR>')

-- markdown-preview
map('n', '<leader>md', '<CMD>MarkdownPreview<CR>', {silent = true})

-- Copilot
vim.keymap.set('i', '<C-J>', 'copilot#Accept("<CR>")', {
expr = true,
replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

function ToggleCopilot()
  if vim.g.copilot_enabled == 1 then
    vim.g.copilot_enabled = 0
    vim.cmd('echo "Copilot disabled"')
  else
    vim.g.copilot_enabled = 1
    vim.cmd('echo "Copilot enabled"')
  end
end

map('n', '<leader>ct', '<CMD>lua ToggleCopilot()<CR>', {silent = true})

-- dapui

map('n', '<leader>db', '<CMD>require("dapui").toggle()<CR>', {silent = true})
