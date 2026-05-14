local plugins = {
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
      require('flutter-tools').setup {}

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(ev)
          vim.lsp.document_color.enable(true, { bufnr = ev.buf })
        end,
      })
    end,
  },
}

return plugins
