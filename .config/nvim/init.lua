require('core.options')
require('core.keymaps')
require('core.lazy')
require('custom.terminal')

require("lazy").setup({
  require("plugins.utils.autoformat"),
  require("plugins.utils.autopairs"),
  require("plugins.utils.completion"),
  require("plugins.utils.lsp"),
  require("plugins.utils.telescope"),
  require("plugins.utils.treesitter"),
  require("plugins.utils.undotree"),
  require("plugins.utils.vimbegood"),
  require("plugins.utils.vimfugitive"),
  require("plugins.utils.whichkey"),
  require("plugins.visuals.alpha"),
  require("plugins.visuals.bufferline"),
  require("plugins.visuals.catppuccin"),
  require("plugins.visuals.colorizer"),
  require("plugins.visuals.fidget"),
  require("plugins.visuals.gitsigns"),
  require("plugins.visuals.indentblankline"),
  require("plugins.visuals.lualine"),
  require("plugins.visuals.neotree"), --  FIX: Setup better alternative (oil, yazi, neotree)
  require("plugins.visuals.noice"),
  require("plugins.visuals.todocomments")
})
