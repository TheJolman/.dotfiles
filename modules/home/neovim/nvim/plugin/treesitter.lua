require("nvim-treesitter.configs").setup({
	ensure_installed = { "python", "bash", "lua", "cpp", "nix", "html", "css", "regex", "markdown_inline" },

	sync_install = false,

	auto_install = true,

	ignore_install = { "htmldjango" },

	highlight = { enable = true },

	indent = { enable = true },

	modules = {},
})
