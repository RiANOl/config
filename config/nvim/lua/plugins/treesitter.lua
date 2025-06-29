return {
    {
	'nvim-treesitter/nvim-treesitter',
	build = ':TSUpdate',
	opts = {
	    ensure_installed = {
		'diff',
		'git_config',
		'git_rebase',
		'gitcommit',
		'gitignore',
	    },

	    auto_install = true,

	    highlight = {
		enable = true,
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = 'gnn',
                    node_incremental = 'grn',
                    scope_incremental = 'grc',
                    node_decremental = 'grm',
                },
            },

	    indent = {
		enable = true,
	    },
	},
        config = function(_, opts)
            require('nvim-treesitter.configs').setup(opts)

            vim.o.foldmethod = 'expr'
            vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            vim.o.foldenable = false
        end
    }
}
