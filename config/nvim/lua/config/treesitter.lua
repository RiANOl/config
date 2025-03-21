require'nvim-treesitter.configs'.setup {
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

    indent = {
        enable = true,
    },
}
