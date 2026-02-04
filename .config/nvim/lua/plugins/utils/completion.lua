return {
  'saghen/blink.cmp',
  event = 'VimEnter',
  version = '1.*',
  dependencies = {
    'folke/lazydev.nvim',
    {
      'L3MON4D3/LuaSnip',
      version = '2.*',
      build = (function()
        if vim.fn.has('win32') == 1 or vim.fn.executable('make') == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
      opts = {},
    },
  },
  opts = {
    keymap = {
      preset = 'none',
      ['<C-k>'] = { 'select_prev', 'snippet_backward', 'fallback' },
      ['<C-j>'] = { 'select_next', 'snippet_forward', 'fallback' },
      ['<Tab>'] = { 'accept', 'fallback' },
    },
    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
      },
    },
    sources = {
      default = {
        'lsp',
        'path',
        'snippets',
        'lazydev',
      },
      providers = {
        lazydev = {
          module = 'lazydev.integrations.blink',
          score_offset = 100,
        },
      },
    },
    snippets = {
      preset = 'luasnip',
    },
    fuzzy = {
      implementation = 'lua',
    },
    signature = {
      enabled = true,
    },
  },
}
