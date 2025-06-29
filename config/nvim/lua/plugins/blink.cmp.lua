return {
    {
        'saghen/blink.cmp',
        dependencies = {
            {
                'Exafunction/codeium.nvim',
            },
        },
        version = '1.*',
        opts = {
            completion = {
                documentation = {
                    auto_show = true,
                },
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer', 'codeium' },
                providers = {
                    codeium = { name = 'Codeium', module = 'codeium.blink', async = true },
                },
            },
            cmdline = {
                completion = {
                    menu = {
                        auto_show = true,
                    },
                },
            },
        },
    }
}
