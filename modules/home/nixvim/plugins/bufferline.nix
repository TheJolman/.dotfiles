{...}: {
  programs.nixvim.plugins.bufferline = {
    enable = true;
    luaConfig.post = ''
      local bufferline = require('bufferline')
      bufferline.setup {
        options = {
          mode = "buffers",
          diagnostics = "nvim_lsp",
          numbers = "ordinal",
          show_close_icon = false,
          show_buffer_close_icons = false,
        },

        vim.keymap.set('n', '<leader>1', function()
            require("bufferline").go_to(1, true)
        end, { silent = true, desc = "Go to buffer 1" }),

        vim.keymap.set('n', '<leader>2', function()
            require("bufferline").go_to(2, true)
        end, { silent = true, desc = "Go to buffer 2" }),

        vim.keymap.set('n', '<leader>3', function()
            require("bufferline").go_to(3, true)
        end, { silent = true, desc = "Go to buffer 3" }),

        vim.keymap.set('n', '<leader>4', function()
            require("bufferline").go_to(4, true)
        end, { silent = true, desc = "Go to buffer 4" }),

        vim.keymap.set('n', '<leader>5', function()
            require("bufferline").go_to(5, true)
        end, { silent = true, desc = "Go to buffer 5" }),

        vim.keymap.set('n', '<leader>6', function()
            require("bufferline").go_to(6, true)
        end, { silent = true, desc = "Go to buffer 6" }),

        vim.keymap.set('n', '<leader>7', function()
            require("bufferline").go_to(7, true)
        end, { silent = true, desc = "Go to buffer 7" }),

        vim.keymap.set('n', '<leader>8', function()
            require("bufferline").go_to(8, true)
        end, { silent = true, desc = "Go to buffer 8" }),

        vim.keymap.set('n', '<leader>9', function()
            require("bufferline").go_to(9, true)
        end, { silent = true, desc = "Go to buffer 9" }),

        vim.keymap.set('n', '<leader>$', function()
            require("bufferline").go_to(-1, true)
        end, { silent = true, desc = "Go to last buffer" }),
      }
    '';
  };
}
