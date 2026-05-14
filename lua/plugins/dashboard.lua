local plugins = {
  {
    'nvimdev/dashboard-nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        -- config
      }
    end,
  },
}

return plugins
