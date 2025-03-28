return {
    {
	'neovim/nvim-lspconfig',
	dependencies = {
	    'hrsh7th/cmp-nvim-lsp',
	    "hrsh7th/nvim-cmp",
	},
	opts = {
	    'gopls',
	    'terraformls',
	    'tflint',
	},
	config = function(_, opts)
	    local lspconfig = require('lspconfig')
	    local capabilities = require('cmp_nvim_lsp').default_capabilities()

	    for i, v in ipairs(opts) do
		lspconfig[v].setup {
		    capabilities = capabilities
		}
	    end
	end
    }
}
