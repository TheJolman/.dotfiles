local dap = require('dap')

dap.adapters.python = {
  type = 'executable';
  command = os.getenv('HOME') .. '/.virtualenvs/tools/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
    pythonPath = function()
      return '/usr/bin/python'
    end;
  },
}

dap.adapters.cpp = {
  type = 'executable';
  command = '/home/josh/.local/share/nvim/mason/bin/OpenDebugAD7';
}

-- dap.configurations.cpp = {
--   name = 'Launch';
--   type = 'cpp';
--   request = 'launch';
--   program = function()
--     return vim.fin.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
--   end;
--   cwd = '${workspaceFolder}';
--   stopOnEntry = false;
--   args = {};
-- }
