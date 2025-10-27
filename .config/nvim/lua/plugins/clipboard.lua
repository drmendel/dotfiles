return {
  "ojroques/nvim-osc52",
  config = function()
    require("osc52").setup {
      max_length = 0, -- 0 = no limit
      silent = false,
      trim = false,
    }

    -- Optional: map visual selection to OSC52 copy
    vim.keymap.set("v", "<leader>y", function()
      local start_pos = vim.fn.getpos "'<"
      local end_pos = vim.fn.getpos "'>"
      local lines = vim.fn.getline(start_pos[2], end_pos[2])

      if #lines == 0 then
        return
      end -- nothing selected

      -- trim first and last lines to selected columns
      lines[1] = string.sub(lines[1] or "", start_pos[3])
      lines[#lines] = string.sub(lines[#lines] or "", 1, end_pos[3])

      require("osc52").copy(table.concat(lines, "\n"))
      print "Copied to system clipboard via OSC52!"
    end, { noremap = true, silent = true })
  end,
}
