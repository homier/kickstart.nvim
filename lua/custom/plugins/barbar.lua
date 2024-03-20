local packages = {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    -- keys = {
    --   { 'n', '<C-c>', '<Cmd>BufferClose<CR>', { silent = true, noremap = true } },
    --   { 'n', '<C-1>', '<Cmd>BufferGoto 1<CR>', { silent = true, noremap = true } },
    --   { 'n', '<C-2>', '<Cmd>BufferGoto 2<CR>', { silent = true, noremap = true } },
    --   { 'n', '<C-3>', '<Cmd>BufferGoto 3<CR>', { silent = true, noremap = true } },
    --   { 'n', '<C-4>', '<Cmd>BufferGoto 4<CR>', { silent = true, noremap = true } },
    --   { 'n', '<C-5>', '<Cmd>BufferGoto 5<CR>', { silent = true, noremap = true } },
    --   { 'n', '<C-6>', '<Cmd>BufferGoto 6<CR>', { silent = true, noremap = true } },
    --   { 'n', '<C-7>', '<Cmd>BufferGoto 7<CR>', { silent = true, noremap = true } },
    --   { 'n', '<C-8>', '<Cmd>BufferGoto 8<CR>', { silent = true, noremap = true } },
    --   { 'n', '<C-9>', '<Cmd>BufferGoto 9<CR>', { silent = true, noremap = true } },
    --   { 'n', '<C-0>', '<Cmd>BufferLast<CR>', { silent = true, noremap = true } },
    -- },
    opts = {
      animation = true,
      auto_hide = 0,
      tabpages = true,
      clickable = true,
      focus_on_close = 'left',
      gitsigns = {
        added = { enabled = true, icon = '+' },
        changed = { enabled = true, icon = '~' },
        deleted = { enabled = true, icon = '-' },
      },
      sidebar_filetypes = {
        NvimTree = true,
      },
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
}

return packages
