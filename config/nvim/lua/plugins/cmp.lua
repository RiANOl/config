return {
    {
	'hrsh7th/nvim-cmp',
	dependencies = {
	    {'hrsh7th/cmp-buffer'},
	    {'hrsh7th/cmp-path'},
	    {'hrsh7th/cmp-cmdline'},
	    {'hrsh7th/cmp-vsnip'},
	    {'hrsh7th/vim-vsnip'},
	    {'onsails/lspkind.nvim'},
	},
	config = function()
	    local cmp = require('cmp')

	    local feedkey = function(key, mode)
	      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
	    end

	    cmp.setup({
		snippet = {
		    expand = function(args)
			vim.fn['vsnip#anonymous'](args.body)
		    end,
		},
		window = {
		    completion = cmp.config.window.bordered(),
		    documentation = cmp.config.window.bordered(),
		},
		mapping = {
		    ['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
			    cmp.select_next_item()
			elseif vim.fn['vsnip#available'](1) == 1 then
			    feedkey('<Plug>(vsnip-expand-or-jump)', '')
			else
			    fallback()
			end
		    end, { 'i', 's' }),

		    ['<S-Tab>'] = cmp.mapping(function()
			if cmp.visible() then
			    cmp.select_prev_item()
			elseif vim.fn['vsnip#jumpable'](-1) == 1 then
			    feedkey('<Plug>(vsnip-jump-prev)', '')
			else
			    fallback()
			end
		    end, { 'i', 's' }),

		    ['<CR>'] = cmp.mapping.confirm({ select = true }),
		},
		sources = cmp.config.sources({
		    { name = 'nvim_lsp' },
		    { name = 'vsnip' },
		    { name = 'codeium' },
		}, {
		    { name = 'buffer' },
		}),
		formatting = {
		    format = require('lspkind').cmp_format(),
		},
		experimental = {
		    ghost_text = true,
		},
	    })

	    cmp.setup.cmdline({ '/', '?' }, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
		    { name = 'buffer' }
		}
	    })

	    cmp.setup.cmdline(':', {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
		    { name = 'path' }
		}, {
		    { name = 'cmdline' }
		}),
		matching = { disallow_symbol_nonprefix_matching = false }
	    })
	end
    }
}
