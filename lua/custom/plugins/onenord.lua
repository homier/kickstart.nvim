local packages = {
  {
    'rmehri01/onenord.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      require('onenord').setup {
        options = {
          theme = 'onenord',
        },
      }
    end,
  },
}

return packages
