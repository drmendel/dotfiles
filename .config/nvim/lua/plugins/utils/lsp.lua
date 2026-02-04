return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'mason-org/mason.nvim',
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'saghen/blink.cmp',
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local tbin = require('telescope.builtin')
        local map = function(mode, keys, func, desc)
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc .. ' (lsp)' })
        end

        map('n', 'grn', vim.lsp.buf.rename, '[R]e[N]ame')
        map({ 'n', 'x' }, 'gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction')
        map('n', 'grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
        map('n', 'grr', tbin.lsp_references, '[G]oto [R]eferences')
        map('n', 'gri', tbin.lsp_implementations, '[G]oto [I]mplementation')
        map('n', 'grd', tbin.lsp_definitions, '[G]oto [D]efinition')
        map('n', 'gO', tbin.lsp_document_symbols, 'Open Document Symbols')
        map('n', 'gW', tbin.lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')
        map('n', 'grt', tbin.lsp_type_definitions, '[G]oto [T]ype Definition')

        local function client_supports_method(client, method, bufnr)
          if vim.fn.has('nvim-0.11') == 1 then
            return client:supports_method(method, bufnr)
          else
            return client:supports_method(method, { bufnr = bufnr })
          end
        end

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if
          client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
        then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })
          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = 'kickstart-lsp-highlight', buffer = event2.buf })
            end,
          })
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            local hint = function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            end
            map('n', '<leader>th', hint, '[T]oggle Inlay [H]ints (lsp)')
          end
        end
      end, --  NOTE: End of callback session
    })

    vim.diagnostic.config({
      update_in_insert = true,
      severity_sort = true,
      float = { border = 'rounded', source = 'if_many' },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = '󰅚 ',
          [vim.diagnostic.severity.WARN] = '󰀪 ',
          [vim.diagnostic.severity.INFO] = '󰋽 ',
          [vim.diagnostic.severity.HINT] = '󰌶 ',
        },
      } or {},
      virtual_text = {
        source = 'if_many',
        spacing = 2,
        format = function(diagnostic)
          local diagnostic_message = {
            [vim.diagnostic.severity.ERROR] = diagnostic.message,
            [vim.diagnostic.severity.WARN] = diagnostic.message,
            [vim.diagnostic.severity.INFO] = diagnostic.message,
            [vim.diagnostic.severity.HINT] = diagnostic.message,
          }
          return diagnostic_message[diagnostic.severity]
        end,
      },
    })

    local capabilities = require('blink.cmp').get_lsp_capabilities()

    local servers = {
      lua_ls = {},
      clangd = {},
    }
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, { 'stylua', 'clang-format' })
    require('mason').setup({})
    require('mason-tool-installer').setup({ ensure_installed = ensure_installed })
    require('mason-lspconfig').setup({
      ensure_installed = {},
      automatic_installation = false,
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    })
  end, -- NOTE: This is the end of the config session
}
