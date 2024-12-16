-- Para desactivar el resaltado después de terminar con una búsqueda
vim.api.nvim_set_keymap('n', '<leader>n', ':nohlsearch<CR>',{noremap = true, silent = true})
