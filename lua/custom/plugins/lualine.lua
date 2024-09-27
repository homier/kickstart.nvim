local packages = {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'EdenEast/nightfox.nvim',
    },
    config = function()
      require('lualine').setup {
        options = {
          component_separators = '',
          --[[ section_separators = { left = '', right = '' }, ]]
          disabled_filetypes = { 'NvimTree' },
        },
      }
    end,
  },
}

return packages
