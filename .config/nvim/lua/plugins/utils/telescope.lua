return {
  'nvim-telescope/telescope.nvim',
  tag = 'v0.1.9',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable('make') == 1
      end,
    },
  },
  config = function()
    require('telescope').setup({
      defaults = {
        mappings = {
          i = {
            ['<C-k>'] = require('telescope.actions').move_selection_previous,
            ['<C-j>'] = require('telescope.actions').move_selection_next,
            ['<C-l>'] = require('telescope.actions').select_default,
          },
        },
      },
      pickers = {
        find_files = {
          file_ignore_patterns = { 'node_modules', '%.git', '%.venv' },
          hidden = true,
        },
        live_grep = {
          file_ignore_patterns = { 'node_modules', '%.git', '%.venv' },
          additional_args = function(_)
            return { '--hidden' }
          end,
        },
      },
      extensions = { ['ui-select'] = { require('telescope.themes').get_dropdown() } },
    })

    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    local btin = require('telescope.builtin')

    local edit_nvim = function()
      btin.find_files({
        cwd = vim.fn.stdpath('config'),
        hidden = true,
        follow = true,
        git_ignore = true,
      })
    end
    local edit_conf = function()
      btin.find_files({
        cwd = vim.fn.fnamemodify(vim.fn.stdpath('config'), ':h'),
        no_ignore = true,
      })
    end
    local edit_rc = function()
      btin.find_files({
        cwd = vim.fn.fnamemodify(vim.fn.stdpath('config'), ':h:h') .. '/.files',
        hidden = true,
        git_ignore = true,
        search_file = '.*rc',
      })
    end
    local edit_dotf = function()
      btin.find_files({
        cwd = vim.fn.fnamemodify(vim.fn.stdpath('config'), ':h:h') .. '/.files',
        hidden = true,
        follow = true,
        git_ignore = true,
        file_ignore_patterns = { '.git' },
      })
    end
    local lg_open = function()
      btin.live_grep({ grep_open_files = true, prompt_title = 'Live Grep in Open Buffers' })
    end
    local fz_buf = function()
      btin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
        winblend = 10,
        previewer = false,
        prompt_title = 'Fuzzy Find in Current Buffer',
      }))
    end

    vim.keymap.set('n', '<leader>en', edit_nvim, { desc = '[E]dit [N]eovim Configuration (telescope)' })
    vim.keymap.set('n', '<leader>ec', edit_conf, { desc = '[E]dit .[C]onfig (telescope)' })
    vim.keymap.set('n', '<leader>er', edit_rc, { desc = '[E]dit [R]C files (telescope)' })
    vim.keymap.set('n', '<leader>ed', edit_dotf, { desc = '[E]dit [D]otfiles (telescope)' })

    vim.keymap.set('n', '<leader>f/', lg_open, { desc = '[F]ind [/] in Open Buffers (telescope)' })
    vim.keymap.set('n', '<leader>fz', fz_buf, { desc = '[F]u[Z]zy Find in Current Buffer (telescope)' })

    vim.keymap.set('n', '<leader>ff', btin.find_files, { desc = '[F]ind [F]iles (telescope)' })
    vim.keymap.set('n', '<leader>fh', btin.help_tags, { desc = '[F]ind [H]elp (telescope)' })
    vim.keymap.set('n', '<leader>fk', btin.keymaps, { desc = '[F]ind [K]eymaps (telescope)' })
    vim.keymap.set('n', '<leader>fc', btin.builtin, { desc = '[F]ind [C]ommand (telescope)' })
    vim.keymap.set('n', '<leader>fw', btin.grep_string, { desc = '[F]ind [W]ord (telescope)' })
    vim.keymap.set('n', '<leader>fg', btin.live_grep, { desc = '[F]ind [G]rep (telescope)' })
    vim.keymap.set('n', '<leader>fd', btin.diagnostics, { desc = '[F]ind [D]iagnostics (telescope)' })
    vim.keymap.set('n', '<leader>fr', btin.resume, { desc = '[F]ind [R]esume (telescope)' })
    vim.keymap.set('n', '<leader>fo', btin.oldfiles, { desc = '[F]ind Recently [O]pened Files (telescope)' })
    vim.keymap.set('n', '<leader>fb', btin.buffers, { desc = '[F]ind [B]uffers (telescope)' })
  end,
}
