_G.term_buf = nil
_G.term_win = nil
_G.prev_win = nil

function _G.tt()
  -- Check if terminal was closed (buffer got invalid)
  if term_buf and not vim.api.nvim_buf_is_valid(term_buf) then
    term_buf = nil
  end

  -- Check if terminal windows exits (close)
  if term_win and vim.api.nvim_get_current_win() == term_win then
    if prev_win and vim.api.nvim_win_is_valid(prev_win) then
      vim.api.nvim_set_current_win(prev_win)
    else
    prev_win = nil
    end
    vim.api.nvim_win_close(term_win, true)
    term_win = nil
    return
  end

  -- Save prev window and open the term window
  prev_win = vim.api.nvim_get_current_win()
  vim.cmd("botright split")
  term_win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_height(term_win, 10)

  -- Check the buffer: load it or creat a new one
  if term_buf then
      vim.api.nvim_win_set_buf(term_win, term_buf)
  else
      vim.cmd.term()
      term_buf = vim.api.nvim_win_get_buf(term_win)
  end
end
