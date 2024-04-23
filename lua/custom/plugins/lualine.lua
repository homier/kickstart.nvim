local packages = {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'rmehri01/onenord.nvim',
    },
    config = function()
      require('lualine').setup {
        options = {
          theme = 'onenord',
          component_separators = '',
          section_separators = { left = '', right = '' },
          disabled_filetypes = { 'NvimTree' },
        },
      }
    end,
  },
}

return packages
