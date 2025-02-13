local lspconfig = require('lspconfig')
lspconfig.matlab_ls.setup({
  cmd = { 'matlab-language-server', '--stdio' },
  filetypes = { 'matlab' },
  root_dir = lspconfig.util.find_git_ancestor,
  settings = {
    MATLAB = {
      indexWorkspace = false,
      installPath = '',
      matlabConnectionTiming = 'onStart',
      telemetry = true,
    },
  },
  single_file_support = true,
})

-- Set filetype for .m files to MATLAB
vim.filetype.add({
  extension = {
    m = 'matlab',
  },
})

lspconfig.csharp_ls.setup({
  root_dir = lspconfig.util.find_git_ancestor,
})
