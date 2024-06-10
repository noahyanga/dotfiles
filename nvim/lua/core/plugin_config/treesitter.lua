require'nvim-treesitter.configs'.setup {
	-- A list of parser name, or "all"
	ensure_installed = { "python","c", "lua", "rust", "ruby", "vim", "markdown"},

	-- install parsers synchronously (only applied to 'ensure_installed')
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
}
