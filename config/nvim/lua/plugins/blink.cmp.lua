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
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = true,
                    },
                },
                menu = {
                    border = 'rounded',
                    auto_show = true,
                },
                documentation = {
                    auto_show = true,
                    window = {
                        border = 'rounded',
                    },
                },
            },
            keymap = {
                preset = 'none',
                ['<CR>'] = { 'accept', 'fallback' },
                ['<Tab>'] = { 'snippet_forward', 'fallback' },
                ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
                ['<Up>'] = { 'select_prev', 'fallback' },
                ['<Down>'] = { 'select_next', 'fallback' },
                ['<PageUp>'] = { 'scroll_documentation_up', 'fallback' },
                ['<PageDown>'] = { 'scroll_documentation_down', 'fallback' },
            },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer', 'codeium' },
                providers = {
                    codeium = { name = 'Codeium', module = 'codeium.blink', async = true },
                },
            },
            cmdline = {
                keymap = {
                    preset = 'none',
                    ['<Tab>'] = { 'select_next', 'fallback' },
                    ['<S-Tab>'] = { 'select_prev', 'fallback' },
                    ['<Up>'] = { 'select_prev', 'fallback' },
                    ['<Down>'] = { 'select_next', 'fallback' },
                },
                completion = {
                    list = {
                        selection = {
                            preselect = false,
                            auto_insert = true,
                        },
                    },
                    menu = {
                        auto_show = true,
                    },
                },
            },
        },
    }
}
