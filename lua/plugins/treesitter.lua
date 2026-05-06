local ensure_installed = {
  'bash',
  'c',
  'go',
  'html',
  'lua',
  'markdown',
  'vim',
  'vimdoc',
}

local packages = {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').install(ensure_installed)

      vim.api.nvim_create_autocmd('FileType', {
        -- `vimdoc` parser serves the `help` filetype
        pattern = { 'bash', 'c', 'go', 'html', 'lua', 'markdown', 'vim', 'help' },
        callback = function()
          vim.treesitter.start()
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}

return packages
