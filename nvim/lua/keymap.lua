local vim = vim

local function set_keymap(mode, keymap, action)
    vim.api.nvim_set_keymap(mode, keymap, action, {noremap = true})
end

-- Normal
set_keymap('n', '<leader>h', ':wincmd h<CR>')
set_keymap('n', '<leader>l', ':wincmd l<CR>')
set_keymap('n', '<leader>k', ':wincmd k<CR>')
set_keymap('n', '<leader>j', ':wincmd j<CR>')
set_keymap('n', '<leader>u', ':Telescope file_browser <CR>')
set_keymap('n', '<C-f>', ':Telescope live_grep<CR>')
set_keymap('n', '<C-p>', ':Telescope find_files<CR>')
set_keymap('n', '<leader>nc', ':Telescope colorscheme<CR>')
set_keymap('n', '<C-b>', ':Telescope projects<CR>')
set_keymap('n', '<leader>z', ':ZenMode<CR>')

-- Terminal
-- set_keymap('t', '<Esc>', '<C-\\><C-n>')

vim.api.nvim_create_user_command('FTStartYarn', function()
    require('FTerm').run({'yarn', 'start'})
end, { bang = true })

vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })

set_keymap('n', '<leader>ft', ':FTermToggle<CR>')
set_keymap('n', '<leader>yft', ':FTStartYarn<CR>')
