require('nvim-treesitter.configs').setup {
    ensure_installed = { 'python', 'bash', 'lua', 'cpp' },

    auto_install = false,

    highlight = { enable = true },

    indent = { enable = true },
}
