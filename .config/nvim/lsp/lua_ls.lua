return {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      workspace = {
        checkThirdParty = false,
        library = {
          '${3rd}/luv/library',
          vim.env.VIMRUNTIME,
          unpack(vim.api.nvim_get_runtime_file('', true)),
        },
      },
      telemetry = { enable = false },
    },
  },
}
