return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          "c",
          "cpp",
          "make",
          "cmake",
          "gitignore",
          "dockerfile",
          "yaml",
          "toml",
          "bash",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "markdown",
          "markdown_inline"
        },
        sync_install = true,
        auto_install = true,
        ignore_install = {},
        modules = {},
        indent = { enable = true },
        highlight = {
          enable = true,
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
          additional_vim_regex_highlighting = false
        },
        incremental_selection = { enable = true }
      })

      vim.keymap.set(
        { "n" },
        "<leader>ss",
        "<cmd>lua require('nvim-treesitter.incremental_selection').init_selection()<CR>",
        { desc = "[S]election [S]tart"}
      )
      vim.keymap.set(
        { "n", "v" },
        "<leader>si",
        "<cmd>lua require('nvim-treesitter.incremental_selection').node_incremental()<CR>",
        { desc = "[S]election [I]ncrement" }
      )
      vim.keymap.set(
        { "n", "v" },
        "<leader>sd",
        "<cmd>lua require('nvim-treesitter.incremental_selection').node_decremental()<CR>",
        { desc = "[S]election [D]ecrement" }
      )
      vim.keymap.set(
        { "n", "v" },
        "<leader>sc",
        "<cmd>lua require('nvim-treesitter.incremental_selection').scope_incremental()<CR>",
        { desc = "[S]election S[C]ope Increment" }
      )
    end
  }
}
