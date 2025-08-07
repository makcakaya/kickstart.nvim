vim.keymap.set('i', 'jk', '<Esc>', { desc = "Exit insert mode with 'jk'" })
vim.keymap.set('n', '<leader>e', vim.cmd.Ex)
vim.keymap.set('n', '<leader>o', 'o<Esc>')
vim.keymap.set('n', '<leader>O', 'O<Esc>')

vim.cmd.colorscheme 'catppuccin-mocha'

vim.o.relativenumber = true -- (Mert)

-- Dim inactive windows
vim.api.nvim_create_autocmd({ 'WinEnter', 'FocusGained' }, {
  callback = function()
    vim.wo.winhl = ''
  end,
})

vim.api.nvim_create_autocmd({ 'WinLeave', 'FocusLost' }, {
  callback = function()
    vim.wo.winhl = 'Normal:InactiveWindow'
  end,
})

-- Define the inactive window highlight
vim.api.nvim_set_hl(0, 'InactiveWindow', { bg = '#1e1e1e', fg = '#888888' })

-- Insert full date in YYYY-MM-DD (Day) format
vim.keymap.set('n', '<leader>td', function()
  local date = os.date '%Y-%m-%d (%A)'
  vim.api.nvim_put({ date }, 'c', true, true)
end)

-- Insert time in 24h format HH:MM
vim.keymap.set('n', '<leader>tt', function()
  local time = os.date '%H:%M'
  vim.api.nvim_put({ time }, 'c', true, true)
end)
