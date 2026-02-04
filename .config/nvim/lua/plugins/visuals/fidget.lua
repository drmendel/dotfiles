return {
  'j-hui/fidget.nvim',
  opts = {
    notification = {
      poll_rate = 10, -- How frequently to update and render notifications
      filter = vim.log.levels.WARN, -- Minimum notifications level
    },
  },
}
