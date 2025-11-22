require('core.options')
require('core.keymaps')
require('core.lazy')
require('custom.terminal')

require("lazy").setup({
  require("plugins.utils.autopairs"),
  require("plugins.utils.telescope"),
  require("plugins.utils.treesitter"),
  require("plugins.utils.undotree"),
  require("plugins.utils.vimbegood"),
  require("plugins.utils.vimfugitive"),
  require("plugins.utils.whichkey")
})
