return {
    {
        'akinsho/bufferline.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },
        opts = {
            options = {
                diagnostics = 'nvim_lsp',
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    local s = " "
                    for e, n in pairs(diagnostics_dict) do
                        local sym = e == "error" and " "
                        or (e == "warning" and " " or " ")
                        s = s .. sym .. n
                    end
                    return s
                end
            }
        },
    }
}
